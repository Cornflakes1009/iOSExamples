//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/25/25.
//

import Foundation
import WeatherKit

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .fahrenheit).value))°F" // degree symbol is done via Option + Shift + 8
    }
    
    public var iconName: String {
        return model.symbolName
    }
}
