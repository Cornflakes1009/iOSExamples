//
//  ContentView.swift
//  iExpense
//
//  Created by Harold Davidson on 6/25/25.
//

import Observation // this isn't necessary, but it allows you to see what @observable (a macro) is doing. You can right click on and select "expand macro" to see
import SwiftUI

@Observable // needed to make a class's changes update the UI
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss // @Environment is a property wrapper
    let name: String
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct ContentView: View {
    // if a state value is a class instead of a struct, we won't see the change on the screen due to a class having multiple owners. A struct only has one owner.
    // You can think of this if User was a class, trying to change the values of your instance won't work. Instead it will change the values in the original class. Adding @Observable fixes this.
    @State private var user = User()
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name:", text: $user.firstName)
            TextField("Last name:", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Harold")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
