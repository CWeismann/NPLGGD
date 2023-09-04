//
//  FriendTimeView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/26/23.
//

import SwiftUI

struct FriendTimeView: View {
    let friend: Friend
    @Binding var isPresentingFriendTimeView: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text(friend.name)
                .font(.system(size: 30, weight: .light, design: .monospaced))
                .foregroundColor(.black)
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
        }
        .padding()
    }
}

struct FriendTimeView_Previews: PreviewProvider {
    static var friend = Friend.exampleData[0]
    
    static var previews: some View {
        FriendTimeView(friend: friend, isPresentingFriendTimeView: .constant(false))
    }
}
