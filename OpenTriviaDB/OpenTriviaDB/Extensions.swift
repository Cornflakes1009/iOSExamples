//
//  Extensions.swift
//  OpenTriviaDB
//
//  Created by Harold Davidson on 12/10/24.
//

import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(Color("AccentColor"))
    }
}
