import SwiftUI

// MARK: - Grandparent View
struct GrandparentView: View {
    @State private var grandparentText: String = "Hello from Grandparent"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Grandparent View")
            
            // Show current state
            Text("Message: \(grandparentText)")
            
            // Pass data to ParentView
            ParentView(grandparentText: $grandparentText)
        }
    }
}

// MARK: - Parent View
struct ParentView: View {
    @Binding var grandparentText: String
    @State private var parentText: String = "Hello from Parent"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Parent View")
            
            // Show current state
            Text("Grandparent's Message: \(grandparentText)")
            
            // Modify grandparent's message
            TextField("Edit Grandparent's Message", text: $grandparentText)
            
            // Pass data to ChildView
            ChildView(parentText: parentText, grandparentText: grandparentText)
        }
    }
}

// MARK: - Child View
struct ChildView: View {
    var parentText: String
    var grandparentText: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Child View")
            
            // Show the parent's message
            Text("Parent's Message: \(parentText)")
                
            // Show the grandparent's message
            Text("Grandparent's Message: \(grandparentText)")
                .padding()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GrandparentView()
    }
}

