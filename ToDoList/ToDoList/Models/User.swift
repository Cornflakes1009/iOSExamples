//
//  User.swift
//  ToDoList
//
//  Created by Harold Davidson on 11/23/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
