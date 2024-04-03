package com.example.flutterandroidapp

import com.ust.mytoastlibrary.showToastMessage
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private  lateinit var  methodChannel: MethodChannel
    private val JAR_CHANNEL= "shaldrin/jarFileTest"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, JAR_CHANNEL)
        methodChannel.setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "showToast") {
                //getting arguments from flutter
                val data = methodCall.arguments() as Map<String, String>?
                var messg = data?.get("data")
//saving the battery percentage in result
                if (messg != null) {
                    showToastMessage(this,messg)
                }

               // result.success(messg)

            }

        }
    }
}
