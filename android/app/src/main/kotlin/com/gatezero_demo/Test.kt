package com.gatezero_demo
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class HomeActivity : FlutterActivity() {
    private val CHANNEL = "test_activity"
    let flutterChannel = FlutterMethodChannel.init(name: "test_activity", binaryMessenger: flutterViewController);
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler(
                object : MethodCallHandler {
                    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                        if(call.method.equals("startNewActivity")) {
                            startNewActivity()
                        }
                    }
                })
    }
    flutterChannel.setMethodCallHandler { (flutterMethodCall, flutterResult) in
        if flutterMethodCall.method == "startNewActivity" {
            UIView.animate(withDuration: 0.5, animations: {
            self.window?.rootViewController = nil

            let viewToPush = SecondViewController()

            let navigationController = UINavigationController(rootViewController: flutterViewController)

            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            self.window.rootViewController = navigationController
            navigationController.isNavigationBarHidden = true
            navigationController.pushViewController(viewToPush, animated: true)
        })
        }
    }
    private fun startNewActivity() {
        val intent = Intent(this, SecondActivity::class.java)
        startActivity(intent)
    }
}