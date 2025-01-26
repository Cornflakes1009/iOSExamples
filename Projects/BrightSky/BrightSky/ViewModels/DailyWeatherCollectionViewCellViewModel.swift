//
//  DailyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/25/25.
//

import Foundation
import WeatherKit

struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather
    
    init(model: DayWeather) {
        self.model = model
    }
}
