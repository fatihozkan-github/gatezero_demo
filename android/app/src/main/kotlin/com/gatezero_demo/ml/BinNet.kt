package com.gatezero_demo.ml

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.RectF
import com.gatezero_demo.data.Box
import com.gatezero_demo.ml.BinDetector
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.task.core.BaseOptions
import org.tensorflow.lite.task.core.ComputeSettings
import org.tensorflow.lite.task.vision.detector.Detection
import org.tensorflow.lite.task.vision.detector.ObjectDetector

class BinNet(private val detector: ObjectDetector) : BinDetector {
    companion object {
        private const val MODEL_FILENAME = "bin_model.tflite"

        fun create(context: Context): BinNet {
            val options = ObjectDetector.ObjectDetectorOptions.builder()
                .setBaseOptions(BaseOptions.builder()
                    .setComputeSettings(ComputeSettings.builder().setDelegate(ComputeSettings.Delegate.GPU)
                        .build()).useGpu()
                    .setNumThreads(4).build())
                .setMaxResults(1)
                .build()
            return BinNet(ObjectDetector.createFromFileAndOptions(context, MODEL_FILENAME, options))
        }
    }

    private var cropRegion: RectF? = null

    override fun estimatePoses(bitmap: Bitmap): Box {
        if (cropRegion == null) {
            cropRegion = initRectF(bitmap.width, bitmap.height)
        }

        var boundingBox = RectF(0.0f, 0.0f, 0.0f, 0.0f)
        var score = 0.0f

        cropRegion?.run {
            val rect = RectF(
                (left * bitmap.width),
                (top * bitmap.height),
                (right * bitmap.width),
                (bottom * bitmap.height)
            )

            val detectBitmap = Bitmap.createBitmap(
                rect.width().toInt(),
                rect.height().toInt(),
                Bitmap.Config.ARGB_8888
            )

            Canvas(detectBitmap).drawBitmap(bitmap, -rect.left, -rect.top, null)

            val tfImage = TensorImage.fromBitmap(bitmap)

            val results: List<Detection> = detector.detect(tfImage)
            boundingBox = results[0].boundingBox
            score = results[0].categories.first().score
        }
        return Box(boundingBox = boundingBox, score = score)
    }


    override fun close() {
        detector.close()
        cropRegion = null
    }

    /**
     * Defines the default crop region.
     * The function provides the initial crop region (pads the full image from both
     * sides to make it a square image) when the algorithm cannot reliably determine
     * the crop region from the previous frame.
     */
    private fun initRectF(imageWidth: Int, imageHeight: Int): RectF {
        val xMin: Float
        val yMin: Float
        val width: Float
        val height: Float
        if (imageWidth > imageHeight) {
            width = 1f
            height = imageWidth.toFloat() / imageHeight
            xMin = 0f
            yMin = (imageHeight / 2f - imageWidth / 2f) / imageHeight
        } else {
            height = 1f
            width = imageHeight.toFloat() / imageWidth
            yMin = 0f
            xMin = (imageWidth / 2f - imageHeight / 2) / imageWidth
        }
        return RectF(
            xMin,
            yMin,
            xMin + width,
            yMin + height
        )
    }
}

//    private fun processInputImage(bitmap: Bitmap, inputWidth: Int, inputHeight: Int): TensorImage? {
//        val width: Int = bitmap.width
//        val height: Int = bitmap.height
//
//        val size = if (height > width) width else height
//        val imageProcessor = ImageProcessor.Builder().apply {
//            add(ResizeWithCropOrPadOp(size, size))
//            add(ResizeOp(inputWidth, inputHeight, ResizeOp.ResizeMethod.BILINEAR))
//        }.build()
//        val tensorImage = TensorImage(DataType.UINT8)
//        tensorImage.load(bitmap)
//        return imageProcessor.process(tensorImage)
//    }