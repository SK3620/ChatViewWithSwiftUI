//
//  ListView.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("トーク")
                    .font(.title2.bold())
                
                Spacer()
                
                HStack {
                    Circle()
                        .frame(width: 40, height: 40)
                    Circle()
                        .frame(width: 40, height: 40)
                    Circle()
                        .frame(width: 40, height: 40)
                }
            }
            
            // List
            ScrollView {
                VStack {
                    ForEach(0..<5) {_ in
                        HStack {
                            Circle()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading) {
                                Text("タイトル")
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
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ListView()
}
