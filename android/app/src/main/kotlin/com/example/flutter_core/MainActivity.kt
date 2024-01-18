package com.example.flutter_core


// import android.content.Intent
// import android.net.Uri
// import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel



class MainActivity: FlutterActivity() {
    //     private val CHANNEL = "com.example.openDocument"

    // override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    //     super.configureFlutterEngine(flutterEngine)
    //     MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
    //         if (call.method == "openDocument") {
    //             val url = call.argument<String>("url")
    //             openDocument(url)
    //             result.success(null)
    //         } else {
    //             result.notImplemented()
    //         }
    //     }
    // }

    // private fun openDocument(url: String?) {
    //     val intent = Intent(Intent.ACTION_VIEW)
    //     intent.data = Uri.parse(url)
    //     startActivity(intent)
    // }

}
