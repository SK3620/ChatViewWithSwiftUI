//
//  ChatView.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct ChatView: View {
    
    // プロパティの値とViewの表示を同期するためのキーワード
    // これが変更されることで、Viewも自動で更新される
    @State private var textFieldText: String = ""
    
    private var vm: ChatViewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Message Area
            messageArea
            
            // Navigation Area
            .overlay(navigationArea, alignment: .top)
        
            // Input Area
            inputArera
        }
    }
}

#Preview {
    ChatView()
}

extension ChatView {
    
    // some → 型を抽象化するためのキーワード
    private var messageArea: some View {
        return ScrollView {
            VStack(spacing: 0) {
                // \.id メモリへの参照を行う
                // または、Messsageクラスに、Identifiableを準拠させることで、Messageのインスタンスが値がユニークになるメンバーを持っていることを保証する よって、id: Stringの定義が必須。→ \.idが不要になる
                ForEach(vm.messages, id: \.id){ message in  
                    MessageRow(message: message)
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(Color("Background"))
    }
    
    private var inputArera: some View {
        return HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            
            // テキストフィールドに入力された値を格納するためのプロパティを作成する
            // $をつけて、参照する（プロパティの値ではなく、プロパティの参照を渡す）
            TextField("Aa", text: $textFieldText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule()) // 枠線を丸くする
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    
                    , alignment: .trailing
                )
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(uiColor: .systemBackground))
    }
    
    private var navigationArea: some View {
        return HStack {
            Image(systemName: "chevron.backward")
                .font(.title2)
            Text("Title")
                .font(.title2.bold())
            Spacer()
            HStack(spacing: 16) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
            .padding()
            .background(Color("Background").opacity(0.9))
    }
}
