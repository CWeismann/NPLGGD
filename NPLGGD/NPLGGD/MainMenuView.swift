//
//  ContentView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/19/23.
//

import SwiftUI


// APP: Top-level view
import SwiftUI
import DeviceActivity

extension DeviceActivityReport.Context {
    static let pieChart = Self("Pie Chart")
}
                    
struct MainMenuView: View {
//    @Binding var friends: [Friend]
    @State private var isPresentingFocusView = false
    @State private var isPresentingFriendsView = false
    @State private var context: DeviceActivityReport.Context = .pieChart
    @State private var filter = DeviceActivityFilter (segment: .daily (during: DateInterval(start: Date().addingTimeInterval(-24.0*3600.0*7.0), end: Date())))
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack {
                // App Name
                Text("NPLGGD")
                    .font(.system(size: 50, weight: .light, design: .monospaced))
//                ZStack {
//                    RoundedRectangle(cornerRadius: 16)
//                    DeviceActivityReport(context, filter: filter)
//                        .frame (height: 130)
//                        .foregroundColor(.white)
//                }
                // Friends Menu
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    Button(action: {
                        isPresentingFriendsView = true
                    }) {
                        Text("FRIENDS")
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            
                    }
                    .fullScreenCover(isPresented: $isPresentingFriendsView) {
                        NavigationView {
//                            FriendsView(friends: $friends, isPresentingFriendsView: $isPresentingFriendsView)
                            FriendsView(isPresentingFriendsView: $isPresentingFriendsView)
                        }
                    }
                }
            }
            Spacer()
            // Daily/Weekly Screen/Focus Time
            // TBA: Integration with ScreenTime API
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    VStack {
                        Text("DAILY SCREEN TIME")
                            .font(.system(size: 20, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(timerInterval: Date.now...Date(timeInterval: 12*60, since: .now), countsDown: false, showsHours: true)
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    VStack {
                        Text("WEEKLY SCREEN TIME")
                            .font(.system(size: 20, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(timerInterval: Date.now...Date(timeInterval: 12*60, since: .now), countsDown: false, showsHours: true)
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    VStack {
                        Text("DAILY FOCUS TIME")
                            .font(.system(size: 20, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text("1:12")
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    VStack {
                        Text("WEEKLY FOCUS TIME")
                            .font(.system(size: 20, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text("2:40")
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    Button(action: {
                        isPresentingFocusView = true
                    }) {
                        Text("DEEP FOCUS")
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                            
                    }
                    .fullScreenCover(isPresented: $isPresentingFocusView) {
                        NavigationView {
                            FocusView(isPresentingFocusView: $isPresentingFocusView)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                // Quote Section
                // TBA: quote randomization
                Text("Lorem ipsum dolor sit amet")
                    .font(.system(size: 22, weight: .light, design: .monospaced))
                    .italic()
                Text("-Anonymous")
                    .font(.system(size: 22, weight: .light, design: .monospaced))
            }
        }
        .padding()
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            MainMenuView(friends: .constant(Friend.exampleData))
            MainMenuView()
        }
    }
}
