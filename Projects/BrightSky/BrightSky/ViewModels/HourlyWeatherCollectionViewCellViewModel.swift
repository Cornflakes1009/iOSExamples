//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/25/25.
//

import Foundation
import WeatherKit

struct HourlyWeatherCollectionViewCellViewModel {
    
    private let model: HourWeather
    
    init(model: HourWeather) {
        self.model = model
    }
    
    public var iconName: String {
        model.symbolName
    }
    
    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .fahrenheit).value))°F" // degree symbol is done via Option + Shift + 8
    }
    
    public var hour: String {
        let hour = Calendar.current.component(.hour, from: model.date)
        return "\(hour):00"
    }
}
