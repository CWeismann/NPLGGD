//
//  FriendStore.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 3/27/23.
//
//  This file is based on ScrumStore.swift, designed by Apple as part of their Scrumdinger project

import Foundation
import SwiftUI

class FriendStore: ObservableObject {
    @Published var friends: [Friend] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("friends.data")
    }
    
    static func load(completion: @escaping (Result<[Friend], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let friendData = try JSONDecoder().decode([Friend].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(friendData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(friends: [Friend], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(friends)
//                print(friends)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(friends.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
