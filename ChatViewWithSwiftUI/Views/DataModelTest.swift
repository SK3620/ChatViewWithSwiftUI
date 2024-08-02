//
//  DataModelTest.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct DataModelTest: View {
    
    let user1 = User(id: "1", name: "user1", image: "phone")
    let user2 = User(id: "2", name: "user2", image: "airplane")
    let user3 = User(id: "3", name: "user3", image: "phone")

    let message = Message(text: "こんにちは", user: User(id: "1", name: "user1", image: "phone"), date: Date(), readed: false)
    
    
    var body: some View {
        VStack {
            Text(user2.name)
            Image(systemName: user2.image)
            Text(message.text)
            Text(message.user.name)
        }
    }
}

#Preview {
    DataModelTest()
}
