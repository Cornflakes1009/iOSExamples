//
//  ContentView.swift
//  Moonshot-Project
//
//  Created by Harold Davidson on 7/27/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
