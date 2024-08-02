//
//  Chat.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

struct Chat: Decodable, Identifiable {
    let id: String
    var messages: [Message]
    
    var recnetMessageText: String {
        guard let recentMessage = self.messages.last else { return "" }
        return recentMessage.text
    }
    
    var recentMessageDateString: String {
        guard let recentMessage = self.messages.last else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: recentMessage.date) else { return ""}
        formatter.dateFormat = "HH:mm" // 再度フォーマットを調整        
        return formatter.string(from: date)
    }
}
