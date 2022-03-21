package com.gatezero_demo.ml

import android.graphics.Bitmap
import com.gatezero_demo.data.Box

interface BinDetector : AutoCloseable {

    fun estimatePoses(bitmap: Bitmap): Box

}