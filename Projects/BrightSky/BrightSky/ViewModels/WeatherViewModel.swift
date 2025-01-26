//
//  WeatherViewModel.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/25/25.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModels: [DailyWeatherCollectionViewCellViewModel])
}
