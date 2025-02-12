//
//  HeaderView.swift
//  ToDoList
//
//  Created by Harold Davidson on 11/25/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        VStack {
            // Header
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(background)
                    .rotationEffect(Angle(degrees: angle))
                    
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .bold()
                    
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                }
                .padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
