package com.gatezero_demo

import android.graphics.*
import com.gatezero_demo.data.Box

//var oldBox:Box = Box(id = -1, score = 0.0f, boundingBox = RectF(0.0f,0.0f,0.0f,0.0f))

object VisualizationUtils {
    fun drawBoundingRect(
            input: Bitmap,
            boxes: List<Box>,
    ): Bitmap {
//        var tester = false
//        if(boxes.isNotEmpty()) {
//            tester = boxes[0].score >= 0.85f
//            if(tester) {
//                oldBox = boxes[0]
//            }
//        }

        val paintLine = Paint().apply {
            strokeWidth = 4f
            color = Color.RED
            style = Paint.Style.STROKE
        }
        val output = input.copy(Bitmap.Config.ARGB_8888, true)
        val originalSizeCanvas = Canvas(output)

//        if(boxes.isNotEmpty()) {
            boxes.forEach { box ->
                box.boundingBox.let {
                    originalSizeCanvas.drawRect(it, paintLine)
//                    originalSizeCanvas.drawBitmap(mask, Rect(0, 0, 100, 100), it, paintLine)
//                    originalSizeCanvas.drawBitmap(mask, null, it, paintLine)

                }
            }
//        } else {
//            oldBox.boundingBox.let {
//                originalSizeCanvas.drawRect(it, paintLine)
////                originalSizeCanvas.drawBitmap(mask, null, it, paintLine)
//            }
//        }

        return output
    }
}