//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Harold Davidson on 11/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else { return }
        
        // get current user id
        let newId =  UUID().uuidString
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        // create model
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date.timeIntervalSinceReferenceDate, isDone: false)
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate > Date().addingTimeInterval(-86400) else { // today minus 24 hours
            return false
        }
        
        return true
    }
}
