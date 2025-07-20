//
//  ContentView.swift
//  Moonshot
//
//  Created by Harold Davidson on 7/11/25.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}


struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
    ]
    
    var body: some View {
        Button("Decode JSON") {
            let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            
            if let user = try? decoder.decode(User.self, from: data) {
                print("Name: \(user.name)")
                print("Street: \(user.address.street)")
                print("City: \(user.address.city)")
            }
                
        }
        
        // Vertical
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        // Horizontal
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        NavigationStack {
            
            
            //        Image(.example) // this is done from Xcode/Swift. The image name is actually "Example.jpg"
            //            .resizable()
            //            .scaledToFit()
            //            //.frame(width: 300, height: 300)
            //        // setting the frame for the image to be presented in 80% of the screen width (.horizonal).
            //            .containerRelativeFrame(.horizontal) { size, axis in
            //                size * 0.8
            //            }
            
//            ScrollView(.vertical) {
//                List(0..<100) { row in
//                    NavigationLink("Row \(row)") {
//                        Text("Details for Row \(row)")
//                    }
//                }
//                .navigationTitle("SwiftUI")
                // LazyVStack only builds items as needed
//                LazyVStack(spacing: 10) {
//                    ForEach(0..<100) {
//                        CustomText(text: "Item \($0)")
//                            .font(.headline)
//                    }
//                }
//                .frame(maxWidth: .infinity) // if you don't set the width, it assumes that it's the width of the content and you can only scroll when you interact with the items themselves. It would be very thin.
//            }
//            Spacer()
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack { // this whole view is the link
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            
//            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
