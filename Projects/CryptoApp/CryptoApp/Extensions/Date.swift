//
//  Date.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/28/25.
//

import Foundation

extension Date {
    
    // convert from "2021-03-13T20:49:26.606Z"
    init(coinGencoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGencoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
