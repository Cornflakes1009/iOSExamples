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
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    // sets the initial value if there isn't one. 
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        
        // MARK: - Binding Text Inputs to show values saved in state.
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name:", text: $user.firstName)
            TextField("Last name:", text: $user.lastName)
            
            // MARK: - A button that presents a sheet that is a second view
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Harold")
            }
        }
        .padding()
        
        // MARK: - List of numbers with delete and edit functionality
        NavigationStack {
            VStack {
                List {
                    // needs to be a list so that the onDelete can be attached to the row. Also, not available on List.
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
        
        // MARK: - User Defaults
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        
    }
    
    // allows for swiping to delete row
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
