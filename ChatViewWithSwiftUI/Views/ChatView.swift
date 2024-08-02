//
//  ChatView.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct ChatView: View {
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
                ForEach(0..<15){ _ in
                    MessageRow()
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(.cyan)
    }
    
    private var inputArera: some View {
        return  HStack {
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Capsule()
                .frame(height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
        .background(.white)
        .padding()
    }
    
    private var navigationArea: some View {
        return   HStack {
            Circle()
                .frame(width: 40, height: 40)
            Text("Title")
            Spacer()
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
            .foregroundColor(.white)
            .padding()
            .background(.black.opacity(0.5))
    }
}
