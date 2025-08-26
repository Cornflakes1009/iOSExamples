//
//  ContentView.swift
//  Navigation
//
//  Created by Harold Davidson on 8/25/25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view with \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                // problem with this approach is that it instantiates the view before it's needed
                //DetailView(number: 556)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
