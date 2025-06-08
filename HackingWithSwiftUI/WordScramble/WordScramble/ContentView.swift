//
//  ContentView.swift
//  WordScramble
//
//  Created by Harold Davidson on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter a word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
}

#Preview {
    ContentView()
}


// MARK: - Content from pre-project. Just showing examples
//struct ContentView: View {
//    let people = ["Harold", "Ajay", "Tiffany", "Jesiel"]
//    
//    var body: some View {
//        List {
//            Section("Section 1") {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//            
//            Section("Section 2") {
//                Text("Section 2 row")
//            }
//        }
//        .listStyle(.grouped)
//        
//        List(0..<5) {
//            Text("Static row \($0)")
//        }
//        
//        List(people, id: \.self) {
//            Text($0)
//        }
//    }
//    func testStrings() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ") // [String]
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        // checking for misspelled words
//        let word = "swift"
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        let allGood = misspelledRange.location == NSNotFound // checking for misspelling
//    }
//    func testBundles() {
//        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//                
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
