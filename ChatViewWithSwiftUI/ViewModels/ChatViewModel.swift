//
//  ChatViewModel.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    var chatData: [Chat] = []
    // ChatViewModelのmessagesプロパティに変更があったら、その都度通知を送る
    @Published var messages: [Message] = []
    
    init() {
        chatData = fetchData()
        messages = chatData[0].messages
    }
    
    private func fetchData() -> [Chat] {
        let fileName = "chatData.json"
        var data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else { fatalError("\(fileName)が見つかりませんでした")}
        do {
            data = try Data(contentsOf: filePath)
            print(data)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            // 変換後のデータをChat型の要素を持つ配列を受け取りたい
           return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換できませんでした")
        }
    }
    
    func addMessage(text: String){
        let newMessage = Message(id: UUID().uuidString, text: text, user: User.currentUser, date: Date().description, readed: false)
        messages.append(newMessage)
    }
}
