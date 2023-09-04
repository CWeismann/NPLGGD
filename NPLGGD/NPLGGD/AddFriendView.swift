//
//  AddFriendView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/26/23.
//

import SwiftUI

struct AddFriendView: View {
    @Binding var friends: [Friend]
    @Binding var isPresentingAddFriendView: Bool
    @State private var friendName = ""
    @Environment(\.dismiss) private var dismiss
    let saveAction: ()->Void
    
    var body: some View {
        VStack{
            TextField("FRIEND NAME", text: $friendName)
                .padding()
                .font(.system(size: 30, weight: .light, design: .monospaced))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Divider()
            Spacer()
            Button {
//                friends.append(Friend(name: friendName))
                dismiss()
            } label: {
                HStack {
                    Button("SAVE") {
                        friends.append(Friend(name: friendName))
                        saveAction()
                        isPresentingAddFriendView = false
                    }
                        .font(.system(size: 30, weight: .light, design: .monospaced))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView(friends: .constant(Friend.exampleData), isPresentingAddFriendView: .constant(true), saveAction: {})
    }
}
