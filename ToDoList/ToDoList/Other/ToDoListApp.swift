//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Harold Davidson on 11/23/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
