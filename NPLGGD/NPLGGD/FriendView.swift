//
//  FriendView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/20/23.
//

import SwiftUI

struct FriendView: View {
    var friend: Friend
    
    var body: some View {
        HStack {
            Text(friend.name)
            Spacer()
            Text(String(friend.dailyTime))
        }
        .padding()
        .font(.system(size: 30, weight: .light, design: .monospaced))
        .foregroundColor(.black)
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friend: Friend.exampleData[0])
            .previewLayout(.fixed(width: 400, height: 40))
    }
}
