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
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<15){ _ in
                        HStack {
                            Circle()
                                .frame(width: 60, height: 60)
                            Capsule()
                                .frame(height: 60)
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
                .padding(.top, 72)
            }
            .background(.cyan)
            .overlay(
                // Navigation Area
                HStack {
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
                
                , alignment: .top
            )
            
            // Input Area
            HStack {
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
    }
}

#Preview {
    ChatView()
}
