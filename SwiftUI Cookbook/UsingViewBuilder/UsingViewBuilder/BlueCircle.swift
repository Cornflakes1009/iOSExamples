//
//  BlueCircle.swift
//  UsingViewBuilder
//
//  Created by Harold Davidson on 9/23/25.
//

import SwiftUI

struct BlueCircle<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 30)
        }
    }
}
