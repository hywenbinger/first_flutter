package com.example.first_flutter

import android.content.Context
import android.os.BatteryManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val mChannelName = "myApp/battery"
    private val mMethodName = "getBattery"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        Log.i("FirstFlutter", "configureFlutterEngine")

        // 1.创建MethodChannel对象
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, mChannelName)

        /// 2.添加调用方法的回调
        methodChannel.setMethodCallHandler { call, result ->

            Log.i("FirstFlutter", "MethodCallHandler, method = ${call.method}")

            // 2.1.如果Flutter端调用的方法名是getBattery
            if (call.method == mMethodName) {
                // 2.1.1.调用Android端方法返回电量信息
                val batteryLevel = getBatteryInfo()

                // 2.1.2.判断是否正常获取到
                if (batteryLevel != -1) {
                    // 获取到返回结果
                    result.success(batteryLevel)
                } else {
                    // 获取不到抛出异常
                    result.error("UNKNOWN", "Battery info is unknown.", null)
                }
            } else {
                // 2.2.如果Flutter端调用的方法名不是getBattery
                result.notImplemented()
            }
        }
    }


    private fun getBatteryInfo(): Int {
        Log.i("FirstFlutter", "getBatteryInfo")
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

}
