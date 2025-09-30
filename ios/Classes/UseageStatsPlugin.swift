import DeviceActivity
import FamilyControls
import Flutter
import UIKit
import os.log

private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "AppUsagePlugin")

public class UseageStatsPlugin: NSObject, FlutterPlugin {

  let center = AuthorizationCenter.shared
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "useage_stats", binaryMessenger: registrar.messenger())
    let instance = UseageStatsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    print("Received method call: \(call.method)")
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getAppUsage":
      getAppUsage(result: result)
    case "openAppusageSettings":
      Task {
        print("Requesting authorization...")
        await requestAppUseagePermission(result: result)
        print("Authorization process completed.")
      }
    case "startMonitoring":
      startMonitoring(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func requestAppUseagePermission(result: @escaping FlutterResult) async {
    do {
      try await center.requestAuthorization(for: .individual)
      print("Authorization granted")
      return result(true)
    } catch {
      print("Error requesting authorization: ")
    }
  }

  // UPDATED `getAppUsage` function
  private func getAppUsage(result: @escaping FlutterResult) {
    // This function now calculates usage from the start of today until the current moment.
    if #available(iOS 16.0, *) {
      Task {
        do {
          // Define the time window: from the start of the current day until now.
          let now = Date()
          let startOfToday = Calendar.current.startOfDay(for: now)
          let interval = DateInterval(start: startOfToday, end: now)

          // We are interested in application usage events.
          let eventTypes: Set<DeviceActivityEvent.Name> = [.applications]

          let center = DeviceActivityCenter()
          let events = try await center.events(for: interval, of: eventTypes)

          var appUsageData: [String: TimeInterval] = [:]

          // Iterate through the stream of events and aggregate the durations.
          for await event in events {
            guard let appName = event.application.bundleIdentifier else { continue }
            print("App: \(appName), Duration: \(event.duration) seconds")
            let duration = event.duration

            let currentTotal = appUsageData[appName] ?? 0
            appUsageData[appName] = currentTotal + duration
          }

          logger.log("Successfully fetched and calculated current usage data.")
          // Send the freshly calculated data back to Flutter.
          result(appUsageData)

        } catch {
          logger.error(
            "Could not fetch device activity events: \(error.localizedDescription, privacy: .public)"
          )
          result(
            FlutterError(
              code: "FETCH_ERROR", message: "Could not fetch device activity events.",
              details: error.localizedDescription))
        }
      }
    } else {
      result(
        FlutterError(
          code: "UNSUPPORTED_OS", message: "Live fetching requires iOS 16.0+", details: nil))
    }
  }

  private func startMonitoring(result: @escaping FlutterResult) {
    // This function tells the system to start asking our extension for its monitoring schedule.
    if #available(iOS 16.0, *) {
      let center = DeviceActivityCenter()
      let schedule = DeviceActivitySchedule(
        intervalStart: DateComponents(hour: 0, minute: 0),  // Midnight
        intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),  // End of day
        repeats: true
      )

      let activityName = DeviceActivityName("daily.app.usage")

      do {
        try center.startMonitoring(activityName, during: schedule)
        result("Monitoring started successfully.")
      } catch {
        result(
          FlutterError(
            code: "MONITOR_ERROR", message: "Failed to start monitoring",
            details: error.localizedDescription))
      }
    } else {
      result(
        FlutterError(
          code: "UNSUPPORTED_OS", message: "DeviceActivityCenter requires iOS 16.0+", details: nil))
    }
  }

}
