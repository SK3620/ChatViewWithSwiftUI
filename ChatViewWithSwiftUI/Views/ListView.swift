//
//  ListView.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var vm: ChatViewModel = ChatViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                header
                
                // List
                list
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ListView()
}

extension ListView {
    
    private var header: some View {
        HStack {
            Text("トーク")
                .font(.title2.bold())
            
            Spacer()
            
            HStack(spacing: 16) {
                Image(systemName: "text.badge.checkmark")
                Image(systemName: "square")
                Image(systemName: "ellipsis.bubble")

            }
            .font(.title2)
        }
    }
    
    private var list: some View {
        ScrollView {
            VStack {
                ForEach(vm.chatData) { chat in
                    NavigationLink {
                        ChatView(chat: chat)
                            .toolbar(.hidden)
                    } label: {
                        listRow
                    }
                }
            }
        }
    }
    
    private var listRow: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("タイトル")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                Text("最新のメッセージ")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            Spacer()
            Text("12/31")
                .font(.caption)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
}
