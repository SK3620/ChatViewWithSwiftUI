//
//  User.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let image: String
    
    var isCurrentUser: Bool {
        self.id == User.currentUser.id
    }
    
    static var currentUser: User {
        User(id: "1", name: "カーキ", image: "person.circle")
    }
}
