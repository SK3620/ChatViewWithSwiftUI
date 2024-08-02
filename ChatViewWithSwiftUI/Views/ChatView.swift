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
    
    // フォーカス状態を、監視したい要素に関連づけることが可能
    // 今回は、textField
    @FocusState private var textFieldFocused: Bool
    
    // これはあくまでもコピーではなく、ChatViewModelクラスのことを参照している
    // そのため、ChatViewModelのmessagesプロパティに変更を加えていけば、それを参照するChatViewクラスの画面も変更される
    // それに必要なのが、ObservedWrapperというPropertyWrapper
    // → 参照元のクラスを監視して、通知（変更等）があった場合、自身のクラスを再描画させることができる
    // その参照元のクラスは、ObservableObjectプロトコルに準拠しなきゃダメ
    // しかし、これは監視対象のオブジェクトから、何らかの通知があったあ際に自身のViewを再描画するだけの役割
    // ChatViewModelのmessagesに"@Published"を追記
    // messagesが変更 → ChatViewModelを監視するChatViewがその変更通知を受け取る → 自身のViewを再描画
    @ObservedObject var vm: ChatViewModel = ChatViewModel()
    
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
        ScrollViewReader { proxy in
            ScrollView {
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
            .onTapGesture {
                textFieldFocused = false
            }
            .onAppear {
                print("スクロールビューが表示されました")
                scrollToLast(proxy: proxy)
            }
        }
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
                .onSubmit {
                    sendMessage()
                }
                .focused($textFieldFocused) // 参照を渡す
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
    
    private func sendMessage(){
        guard textFieldText != "" else { return }
        vm.addMessage(text: textFieldText)
        textFieldText = "" // 空文字入れて、Viewが再描画される
    }
    
    private func scrollToLast(proxy: ScrollViewProxy) {
        if let lastMessage = vm.messages.last {
            proxy.scrollTo(lastMessage.id, anchor: .bottom) // ユニークになる必要がある
        } // 配列の最後のメッセージ
    }
}
