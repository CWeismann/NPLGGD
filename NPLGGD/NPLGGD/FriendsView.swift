//
//  FriendsView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/20/23.
//

import SwiftUI

struct FriendsView: View {
//    @State var friends: [Friend]
    @Binding var isPresentingFriendsView: Bool
    @State private var isPresentingAddFriendView = false
    @State private var isPresentingFriendTimeView = false
    @State private var friendName = ""
    @State private var currentFriend = Friend(name: "")
//    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismiss) private var dismiss
    @StateObject private var store = FriendStore()
    
    var body: some View {
        VStack {
            Text("RANKING")
                .font(.system(size: 50, weight: .light, design: .monospaced))
                .foregroundColor(.black)
            // a list of your friends
            ZStack {
                Rectangle().fill(Color(.black))
                List {
                    ForEach(store.friends) { friend in
                        Button(action: {
                            isPresentingFriendTimeView = true
                            currentFriend = friend
                        }) {
                            FriendView(friend: friend)
                        }
                        .sheet(isPresented: $isPresentingFriendTimeView) {
                            NavigationView {
                                FriendTimeView(friend: currentFriend, isPresentingFriendTimeView: $isPresentingFriendTimeView)
                                    
                            }
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.hidden)
                        }
                    }
                }
            }
            Spacer()
            HStack {
                // Go back
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30, weight: .light, design: .monospaced))
                            .foregroundColor(.black)
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 40, bottom: 0, trailing: 0))
                Spacer()
                // Add a new friend
                Button(action: {
                    isPresentingAddFriendView = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 30, weight: .light, design: .monospaced))
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $isPresentingAddFriendView) {
                    NavigationView {
                        AddFriendView(friends: $store.friends, isPresentingAddFriendView: $isPresentingAddFriendView) {
                            FriendStore.save(friends: store.friends) { result in
                                if case .failure(let error) = result {
                                    fatalError(error.localizedDescription)
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                }
//                .onChange(of: scenePhase) { phase in
//                    print("hi")
//                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 40))
            }
        }
        .onAppear {
            FriendStore.load { result in
                switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                case .success(let friends):
                    store.friends = friends
                }
            }
        }
        .background(.white)
        .navigationBarBackButtonHidden(true)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(isPresentingFriendsView: .constant(false))
    }
}
