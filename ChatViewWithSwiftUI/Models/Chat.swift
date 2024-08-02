//
//  Chat.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

struct Chat: Decodable, Identifiable {
    let id: String
    let messages: [Message]
    
    var recnetMessageText: String {
        guard let recentMessage = self.messages.last else { return "" }
        return recentMessage.text
    }
}
