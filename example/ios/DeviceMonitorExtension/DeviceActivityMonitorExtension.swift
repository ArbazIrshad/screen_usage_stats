//
//  DeviceActivityMonitorExtension.swift
//  DeviceMonitorExtension
//
//  Created by Muhammad Haroon on 30/09/2025.
//

import DeviceActivity
import Foundation

// IMPORTANT: This identifier MUST exactly match the one in your main app's capabilities
// and in the SwiftAppUsageDetectorPlugin.swift file.
let appGroupName = "group.com.yourcompany.yourappname"

// The key used to save the usage data dictionary in the shared storage.
let userDefaultsKey = "appUsageData"

// Optionally override any of the functions below.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        
        // Handle the start of the interval.
        // This is the perfect place to clear out the previous day's data to ensure
          // you are only tracking today's usage.
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
              userDefaults.removeObject(forKey: userDefaultsKey)
//              logger.log("Cleared previous day's usage data.")
        }
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        
        // Handle the end of the interval.
    }
    
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventDidReachThreshold(event, activity: activity)
        
        // Handle the event reaching its threshold.
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        super.intervalWillStartWarning(for: activity)
        
        // Handle the warning before the interval starts.
    }
    
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        super.intervalWillEndWarning(for: activity)
        
        // Handle the warning before the interval ends.
    }
    
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventWillReachThresholdWarning(event, activity: activity)
        
        // Handle the warning before the event reaches its threshold.
    }
}
