//
//  ContentView.swift
//  UsingSFSymbols
//
//  Created by Harold Davidson on 9/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
              Image(systemName: "c")
              Image(systemName: "0")
              Image(systemName: "0")
              Image(systemName: "k")
            }
            .symbolVariant(.fill.circle)
            .foregroundStyle(.yellow, .blue)
            .font(.title)
            
            HStack {
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                    .foregroundStyle(.red)
                Image(systemName: "o.circle.fill")
                    .imageScale(.large)
                Image(systemName: "k.circle.fill")
                    .accessibility(identifier: "Letter K")
            }
            
            HStack {
                Image(systemName: "allergens")
                Image(systemName: "ladybug")
            }
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            .font(.largeTitle)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
