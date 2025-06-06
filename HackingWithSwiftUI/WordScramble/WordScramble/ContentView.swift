//
//  ContentView.swift
//  WordScramble
//
//  Created by Harold Davidson on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    let people = ["Harold", "Ajay", "Tiffany", "Jesiel"]
    
    var body: some View {
        List {
            Section("Section 1") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 2") {
                Text("Section 2 row")
            }
        }
        .listStyle(.grouped)
        
        List(0..<5) {
            Text("Static row \($0)")
        }
        
        List(people, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ContentView()
}
