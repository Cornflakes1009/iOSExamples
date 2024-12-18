//
//  ContentView.swift
//  Authenticator
//
//  Created by Harold Davidson on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    var body: some View {
        NavigationStack {
            VStack {
                if authenticationManager.isAuthenticated {
                    VStack(spacing: 40) {
                        Title()
                        
                        Text("Welcome in! You are now authenticated.")
                            .foregroundStyle(.white)
                        
                        PrimaryButton(text: "Logout")
                            .onTapGesture {
                                authenticationManager.logOut()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                } else {
                    LoginView()
                        .environmentObject(authenticationManager)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .alert(isPresented: $authenticationManager.showAlert, content: {
                Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to log in with credentials. Please try again."), dismissButton: .default(Text("OK")))
            })
        }
    }
}

#Preview {
    ContentView()
}
