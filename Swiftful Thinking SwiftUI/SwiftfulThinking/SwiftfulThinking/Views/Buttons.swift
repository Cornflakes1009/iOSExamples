//
//  Buttons.swift
//  SwiftfulThinking
//
//  Created by Harold Davidson on 1/17/25.
//

import SwiftUI

struct Buttons: View {
    @State var title = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            // MARK: - Button 1
            Button("Press me!") {
                self.title = "Button #1 was pressed"
            }
            .tint(.red)
            
            // MARK: - Button 2
            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: { // label can take any type of view
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                        )
            })
            
            // MARK: - Button 3
            Button(action: {
                self.title = "Button #3 was pressed"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.red))
            })
            
            // MARK: - Button 4
            Button(action: {
                self.title = "Button #4 was pressed"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2.0)
                    )
            })
        }
    }
}

#Preview {
    Buttons()
}
