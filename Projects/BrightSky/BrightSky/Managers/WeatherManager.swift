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
    
    let service = WeatherService.shared // singlton since we only want one
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print(result.currentWeather)
                print(result.hourlyForecast)
                print(result.dailyForecast)
                completion()
            } catch {
                print(String(describing: error))
            }
        }
    }
}
