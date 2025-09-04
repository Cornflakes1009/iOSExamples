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
    
    @State private var path2 = NavigationPath() // used for programmatic navigation
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
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show 32") {
//                    path = [32]
//                }
//                
//                Button("Show 64") {
//                    path.append(64)
//                }
//                
//                // this will navigate twice
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
        
        // Navigating using different data types
        // what's interesting about this is that the two items inside the toolbar still push to the new view and use the string or int navigationDestination based solely on their type. 
        NavigationStack(path: $path2) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path2.append(556)
                }
                
                Button("Push Hello") {
                    path2.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
