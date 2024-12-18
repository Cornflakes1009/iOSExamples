//
//  Answer.swift
//  OpenTriviaDB
//
//  Created by Harold Davidson on 12/10/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
