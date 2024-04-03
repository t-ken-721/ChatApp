//
//  Chat.swift
//  chatapp
//
//  Created by 戸沢健治 on 2024/04/03.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let messages: [Message]
}
