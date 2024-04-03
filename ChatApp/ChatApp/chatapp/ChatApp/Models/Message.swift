//
//  Message.swift
//  chatapp
//
//  Created by 戸沢健治 on 2024/04/02.
//

import Foundation

struct Message: Decodable, Identifiable {
    let id: String
    let text: String
    let user: User
    let date: String
    let readed: Bool
}
