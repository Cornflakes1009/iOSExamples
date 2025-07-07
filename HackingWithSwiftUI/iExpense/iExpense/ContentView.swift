//
//  ContentView.swift
//  iExpense
//
//  Created by Harold Davidson on 7/3/25.
//

// to get a UUID in console, you can type "uuidgen"

import SwiftUI

// this data type can be uniquely identified.
// this makes it so we can delete the id part in ForEach(expenses.items, id: \.id) { item in
struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("eExpense")
            .toolbar {
                // "Add Expense" is for voiceover. Doesn't actually show on screen
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
