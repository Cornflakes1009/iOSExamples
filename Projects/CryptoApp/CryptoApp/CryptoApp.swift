//
//  CryptoApp.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/6/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm) // every child of the HomeView also has acces to this vm.
        }
    }
}