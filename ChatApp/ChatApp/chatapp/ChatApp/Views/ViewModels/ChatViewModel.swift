//
//  ChatViewModel.swift
//  chatapp
//
//  Created by 戸沢健治 on 2024/04/03.
//

import Foundation

class ChatViewModel {
    
    var chatData: [Chat] = []
    var messages: [Message] = []
    
    init() {
        chatData = fetchChatData()
        messages = chatData[0].messages
    }
    
   private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
   guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else
        {
     fatalError("\(fileName)が見つかりませんでした")
  }
        
  do {
      data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のダウンロードに失敗しました")
        }
  do {
        return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました")
        }
    }
    
    func addMessage(text: String) {
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: Date().description,
            readed: false
        )
        
        messages.append(newMessage)
    }
}
