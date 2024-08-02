//
//  MessageRow.swift
//  ChatViewWithSwiftUI
//
//  Created by 鈴木 健太 on 2024/08/02.
//

import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle")
                .resizable() // frameを設定する前に、resizable()でresize可能にさせる
                .frame(width: 48, height: 48)
            Text("こんにちは！")
                .padding()
                .background(.white)
                .cornerRadius(30)
            VStack(alignment: .trailing) {
                Spacer()
                Text("既読")
                Text(formattedDataString)
            }
            .foregroundColor(.secondary)
            .font(.footnote)
            
            Spacer()
        }
        .padding(.bottom)
    }
    
    private var formattedDataString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}

#Preview {
    MessageRow()
        .background(.cyan)
}
