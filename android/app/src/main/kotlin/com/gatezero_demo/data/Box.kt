package com.gatezero_demo.data

import android.graphics.RectF

data class Box(
    var id: Int = -1,
    val boundingBox: RectF,
    val score: Float
)
