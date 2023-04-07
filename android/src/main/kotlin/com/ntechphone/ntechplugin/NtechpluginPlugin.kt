package com.ntechphone.ntechplugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.PluginRegistry
import android.content.Context
import android.telephony.TelephonyManager
/** NtechpluginPlugin */
class NtechpluginPlugin: FlutterPlugin, MethodCallHandler {
    private lateinit var context: Context
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
     context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ntechplugin")
    channel.setMethodCallHandler(this)
    
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "endPhoneCall") {
        val telephonyManager = context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
          if (telephonyManager.callState == TelephonyManager.CALL_STATE_OFFHOOK) {
          try {
              val iEndCall = Class.forName("android.telephony.TelephonyManager").getDeclaredMethod("endCall")
              iEndCall.isAccessible = true
              iEndCall.invoke(telephonyManager)
              result.success("Finish End Call from Kotlin ")
          } catch (e: Exception) {
            e.printStackTrace()
            result.notImplemented()
              // handle the exception
          }
        }
   
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
