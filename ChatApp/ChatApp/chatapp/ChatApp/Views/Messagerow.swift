//
//  Messagerow.swift
//  chatapp
//
//  Created by 戸沢健治 on 2024/03/29.
//

import SwiftUI

struct Messagerow: View {
    
    let message: Message
    
    var body: some View {
        HStack(alignment: .top) {
            
            if message.user.isCurrentUser {
                Spacer()
                messageState
                messageText
            }else {
                userthumb
                messageText
                messageState
                    Spacer()
            }
        }
        .padding(.bottom)
    }
}

//#Preview {
//    Messagerow()
//                    .background(.cyan)
//}

extension Messagerow {
    
    private var userthumb: some View {
        Image(message.user.image)
            .resizable()
            .frame(width:48,height:48)
    }
    
    private var messageText: some View {
        Text(message.text)
            .padding()
            .background(message.user.isCurrentUser ? Color("Bubble") : Color(uiColor: .tertiarySystemBackground))
            .foregroundColor(message.user.isCurrentUser ? .black : .primary)
            .cornerRadius(30)
    }
    
    private var messageState: some View {
        VStack(alignment: .trailing) {
            Spacer()
            if message.user.isCurrentUser && message.readed {
                Text("既読")
            }
            Text(formatteddatestring)
            }
            .foregroundColor(.secondary)
            .font(.footnote)
    }
    
    private var formatteddatestring:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: message.date) else { return""}
        formatter.dateFormat = "HH:MM"
        return formatter.string(from: date)
    }
}
