//
//  NPLGGDApp.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/19/23.
//

import SwiftUI
import FamilyControls
import DeviceActivity

@main
struct NPLGGDApp: App {
    @StateObject private var store = FriendStore()
    let center = AuthorizationCenter.shared
    @State private var context: DeviceActivityReport.Context = .pieChart
    @State private var filter = DeviceActivityFilter(segment: .daily(during: DateInterval(start: .now - 7*24*60*60, end: .now)))

    var body: some Scene {
        WindowGroup {
            NavigationView {
//                MainMenuView(friends: $store.friends)
                MainMenuView()
            }
            .onAppear {
                Task {
                    do {
                        try await center.requestAuthorization(for: .individual)
                    } catch {
                        print("Failed: \(error)")
                    }
                }
            }
        }
    }
}
