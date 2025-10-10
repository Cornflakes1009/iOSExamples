//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Harold Davidson on 10/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.5
    @State private var color = Color.red
    @State private var secondColor = Color.yellow
    @State private var someText = "Initial Text"
    
    var body: some View {
        List {
            Section(header: Text("ProgressViews")) {
                ProgressView("Indertiminate progress view")
                ProgressView("Downloading", value: progress, total: 2)
                Button("More") {
                    if progress < 2 {
                        progress += 0.5
                    }
                }
            }
            
            Section(header: Text("Labels")) {
                Label("Slow", systemImage: "tortoise.fill")
                Label {
                    Text("Fast")
                        .font(.title)
                } icon : {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 40, height: 20, alignment: .center)
                        .overlay(Text("F"))
                }
            }
            
            Section(header: Text("ColorPicker")) {
                ColorPicker(selection: $color) {
                    Text("pick my background")
                        .background(color)
                        .padding()
                }
                ColorPicker("Picker", selection: $secondColor)
            }
            
            Section(header: Text("Link")) {
                Link("Packt Publishing", destination: URL(string: "https://www.packtpub.com/")!)
            }
            
            Section(header: Text("TextEditor")) {
                TextEditor(text: $someText)
                Text("current editor text: \n\(someText)")
            }
        }
        
        //stopped on page 46 step 7
    }
}

#Preview {
    ContentView()
}
