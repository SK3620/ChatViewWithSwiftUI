//
//  Chat.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let massages: [Message]
}
