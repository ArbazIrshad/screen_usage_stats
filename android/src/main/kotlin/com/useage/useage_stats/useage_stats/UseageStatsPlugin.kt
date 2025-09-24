package com.useage.useage_stats.useage_stats


import android.app.Activity
import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.pm.PackageManager
import android.content.Intent
import android.provider.Settings
import android.util.Log


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.time.LocalDate
import java.time.ZoneId
import kotlin.toString


/**
 * The number of milliseconds for one minute.
 */
const val OneMinuteInMs = 60 * 1000L

/**
 * The number of milliseconds for one second.
 */
const val TenSecondsInMs = 10 * 1000L

/** UseageStatsPlugin */
class UseageStatsPlugin :
    FlutterPlugin,
    MethodCallHandler,
    ActivityAware {
    /// The Activity that will be used to start intents
    /// when the settings are opened as another task.
    private var activity: Activity? = null
    private lateinit var context: Context
    private lateinit var packageManager: PackageManager


    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "useage_stats")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        packageManager = context.packageManager
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
//        if (call.method == "getPlatformVersion") {
//            result.success("Android ${android.os.Build.VERSION.RELEASE}")
//        } else {
//            result.notImplemented()
//        }
        when(call.method) {
            "getPlatformVersion" ->   result.success("Android ${android.os.Build.VERSION.RELEASE}")
            "openAppusageSettings" -> openAppUsageSetting(result)
            "getUpdatedUsageStatsToday" -> getUpdatedUsageStatsToday(result)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        this.activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        this.activity = null
    }

    fun openAppUsageSetting(result: Result) {
//        context.startActivity(Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS).apply {
//            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
//        })
        try {
            val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            this.activity?.startActivity(intent)
            result.success(null)
        } catch(e: Exception) {
            Log.d("openAppUsageSetting", "Error while opening settings");
        }


    }


    /**
     * The timestamp of the last refresh of [usageStatsToday]. This is used to cache the usage stats
     * for one minute.
     */
    private var usageStatsTodayLastRefresh = 0L

    /**
     * Returns the usage stats for the current day. This list is cached for one minute to reduce
     * the number of calls to the system service.
     */
    var usageStatsToday: Map<String, UsageStats> = mapOf()
        get() {
            val now = System.currentTimeMillis()
            if (now - usageStatsTodayLastRefresh > TenSecondsInMs) {
                // retrieve usage stats for the current day
                val usageStatsManager = context.getSystemService(
                    Context.USAGE_STATS_SERVICE
                ) as UsageStatsManager
                val dayBeginningMs =
                    LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()
                        .toEpochMilli()
                field = usageStatsManager.queryUsageStats(
                    UsageStatsManager.INTERVAL_DAILY, dayBeginningMs, now
                ).filter {
                    // filter out apps that were not used today
                    it.lastTimeUsed >= dayBeginningMs && it.totalTimeInForeground > 0
                }.groupingBy {
                    // group by package name...
                    it.packageName
                }.aggregate { _, accumulator, element, first ->
                    // ... and sum up the usage stats for each package name
                    if (first) element else accumulator!!.apply { add(element) }
                }
                usageStatsTodayLastRefresh = now
            }
            return field
        }

    /**
     * Returns the usage stats for the current day without consulting the cache.
     */
    fun getUpdatedUsageStatsToday(result: Result ) {
        try {
            usageStatsTodayLastRefresh = 0L
            val convertedMap: Map<String, Any?> =  usageStatsToday.mapValues {
                it.value.toMap(packageManager)
            }
            result.success(convertedMap)

        } catch (e: Exception){
            Log.d("getUpdatedUsageStatsToday", "ERROR WHILE GETTING USEAGE STATS")
            result.error("PERMISSION_DENIED", "Required permission not granted", null)
        }
    }

    /**
     * Returns the screen time of the given apps in milliseconds.
     */
    fun getScreenTimeForApps(apps: List<String>): Long {
        return apps.sumOf { usageStatsToday[it]?.totalTimeInForeground ?: 0L }
    }
}

fun UsageStats.toMap(packageManager: PackageManager): Map<String, Any?> {
    val applicationInfo = packageManager.getApplicationInfo(this.packageName, 0)
    val applicationName =  packageManager.getApplicationInfo(this.packageName, 0).loadLabel(packageManager).toString()

//    packageManager.getApplicationLabel(applicationInfo).toString()
    return mapOf(
        "applicationName" to applicationName,
        "packageName" to this.packageName,
        "totalTimeInForeground" to this.totalTimeInForeground,
        "lastTimeUsed" to this.lastTimeUsed,
        "firstTimeStamp" to this.firstTimeStamp,
        "describeContents" to this.describeContents(),
        "totalTimeVisible" to this.totalTimeVisible,
        "totalTimeInForeground" to this.totalTimeInForeground,
        "lastTimeVisible" to this.lastTimeVisible,
        "totalTimeForegroundServiceUsed" to this.totalTimeForegroundServiceUsed,
        "lastTimeForegroundServiceUsed" to this.lastTimeForegroundServiceUsed,
        "lastTimeStamp" to this.lastTimeStamp
    )
}
