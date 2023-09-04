//
//  Friend.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/20/23.
//

import Foundation

struct Friend: Identifiable, Codable {
    let id: UUID
    var name: String
    var dailyTime: Int
    var weeklyTime: Int
    var dailyFocus: Int
    var weeklyFocus: Int
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
        self.dailyTime = 0
        self.weeklyTime = 0
        self.dailyFocus = 0
        self.weeklyFocus = 0
    }
}

extension Friend {
    static let exampleData: [Friend] =
    [
        Friend(name: "Alice"),
        Friend(name: "Bob"),
        Friend(name: "Cathy"),
        Friend(name: "David")
    ]
}
