//
//  AddView.swift
//  iExpense
//
//  Created by Harold Davidson on 7/6/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss // used to dismiss the view
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types: [String] = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss() // need to delcare as environment object above.
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
