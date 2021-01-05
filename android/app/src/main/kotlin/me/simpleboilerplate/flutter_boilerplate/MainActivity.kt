package me.simpleboilerplate.flutter_boilerplate

import android.view.ViewTreeObserver
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val flutter_native_splash = true
        var originalStatusBarColor = 0
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            originalStatusBarColor = window.statusBarColor
            window.statusBarColor = 0xff88aa51.toInt()
        }
        val originalStatusBarColorFinal = originalStatusBarColor

        val vto = flutterView.viewTreeObserver
        vto.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
            override fun onGlobalLayout() {
                flutterView.viewTreeObserver.removeOnGlobalLayoutListener(this)
                window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    window.statusBarColor = originalStatusBarColorFinal
                }
            }
        })

    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

        }
    }

}