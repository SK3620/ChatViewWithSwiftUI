//
//  Message.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

struct Message {
    let id: String = UUID().uuidString // 初期値 自動的にidを生成
    let text: String
    let user: User
    let date: Date
    let readed: Bool
}
