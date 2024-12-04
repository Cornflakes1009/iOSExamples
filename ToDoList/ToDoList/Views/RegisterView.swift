//
//  RegisterView.swift
//  ToDoList
//
//  Created by Harold Davidson on 11/23/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        HeaderView(title: "Register", subtitle: "Start organizing todo", angle: -15, background: .orange)
        
        Form {
            TextField("Full name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
            
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title: "Create Account", background: .green, action: {
                viewModel.register()
            })
            .padding()
        }
        .offset(y: -50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
