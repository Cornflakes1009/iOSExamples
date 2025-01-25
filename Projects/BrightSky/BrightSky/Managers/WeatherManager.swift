//
//  WeatherManager.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/15/25.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    
    public private(set) var currentWeather: CurrentWeather? // private set means only things in the class can write to it
    public private(set) var hourlyWeather: [HourWeather] = [] // private set means only things in the class can write to it
    public private(set) var dailyWeather: [DayWeather] = []// private set means only things in the class can write to it
    
    let service = WeatherService.shared // singlton since we only want one
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print(result.currentWeather)
                print(result.hourlyForecast)
                print(result.dailyForecast)
                self.currentWeather = result.currentWeather
                self.dailyWeather = result.dailyForecast.forecast
                self.hourlyWeather = result.hourlyForecast.forecast
                completion()
            } catch {
                print(String(describing: error))
            }
        }
    }
}
