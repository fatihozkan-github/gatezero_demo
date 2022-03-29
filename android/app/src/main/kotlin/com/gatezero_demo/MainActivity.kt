package com.gatezero_demo

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "samples.flutter.dev/battery"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "helloFromNativeCode") {
//                val intent = Intent(this, CameraView::class.java)
//                startActivity(intent)
////                result.success(true)
//            }
        }
    }
}
