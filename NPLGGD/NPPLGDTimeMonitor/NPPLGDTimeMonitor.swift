//
//  NPPLGDTimeMonitor.swift
//  NPPLGDTimeMonitor
//
//  Created by Charlie Weismann on 4/12/23.
//

import DeviceActivity
import SwiftUI

//@main
struct NPPLGDTimeMonitor: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
