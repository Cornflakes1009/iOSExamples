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
    
    @State private var path = [Int]()
    
    var body: some View {
//        NavigationStack {
//            // problem with this approach is that it instantiates the view before it's needed
////            NavigationLink("Tap Me") {
////                DetailView(number: 556)
////            }
//            
//            // this only happens when you choose an option. Much more efficient
//            List(0..<100) { i in
//                NavigationLink("Select \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
        
        // This option allows you to navigate once some other action is perform. Say once data has been fetched from an API."path" is a state variable.
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                // this will navigate twice
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
