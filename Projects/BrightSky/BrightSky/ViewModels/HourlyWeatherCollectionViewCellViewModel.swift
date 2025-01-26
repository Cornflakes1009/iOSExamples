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
}
