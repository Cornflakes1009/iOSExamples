//
//  ContentView.swift
//  BetterRest
//
//  Created by Harold Davidson on 5/28/25.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        //        Text(Date.now, format: .dateTime.day().month().year()) // May 30, 2025
        //        Text(Date.now.formatted(date: .long, time: .shortened)) // May 30, 2025 at &:31PM
        //        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        //        DatePicker("Please enter a date:", selection: $wakeUp, in: Date.now...)
        //            .labelsHidden() // this hides the label. A screen reader would still read the string value
        NavigationStack {
            Form {
                Section("When do you want to wake up?", content: {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                })
                .font(.headline)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { number in
                            Text("\(number)")
                        }
                        
                    }
                    //                    Text("Daily coffee intake")
                    //                        .font(.headline)
                    //                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20) // this is magic that changes it from 1 cup to 2 cups with S
                }
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            
        }
        
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 // hour in seconds.
            let minute = (components.minute ?? 0) * 60 // minutes in seconds.
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showAlert = true
    }
    //    func exampleDates() {
    //        var components = DateComponents()
    //        components.hour = 8
    //        components.minute = 0
    //        let date = Calendar.current.date(from: components) ?? .now
    //
    //        let now = Date.now
    //        let tomorrow = Date.now.addingTimeInterval(86400)
    //        let range = now...tomorrow
    
    //        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    //        let hour = components.hour ?? 0
    //        let minute = components.minute ?? 0
    //
    //    }
}

#Preview {
    ContentView()
}
