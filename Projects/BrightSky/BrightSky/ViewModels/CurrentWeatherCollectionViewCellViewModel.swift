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
}
