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
    @State private var score: Int = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Score: \(score)")
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
            .onAppear(perform: startGame)
            .toolbar {
                Button("New Word", action: startGame)
            }

            .alert(errorTitle, isPresented: $showError) {
                Button("OK") {} // don't actually have to add an OK button. SwiftUI will do it automatically.
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 2 else {
            wordError(title: "Word too short!", message: "Use a longer word!")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Can't do that!", message: "You have to choose a different word!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already!", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word no recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        score += 1
    }
    
    func startGame() {
        score = 0
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .ascii) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
            
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false // couldn't find word
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
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
