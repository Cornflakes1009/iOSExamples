//
//  Double.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/9/25.
//

import Foundation

extension Double {
    
    /// Converts a double into a Currency iwth 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.23456 to $12.34
    /// Convert 0.123456 to $0.12
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true // this makes numbers use commas
        formatter.numberStyle = .currency
        //formatter.locale = .current // default value
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2 // sets the minimum number of decimal digits
        formatter.maximumFractionDigits = 2 // sets the maximum number of decimal digits
        return formatter
    }
    
    /// Converts a double into a Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.23456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a double into a Currency iwth 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.23456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true // this makes numbers use commas
        formatter.numberStyle = .currency
        //formatter.locale = .current // default value
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2 // sets the minimum number of decimal digits
        formatter.maximumFractionDigits = 6 // sets the maximum number of decimal digits
        return formatter
    }
    
    /// Converts a double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.23456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a double into a String representation - only gets 2 decimal places
    /// ```
    /// Convert 1.234.56 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a double into a String representation with % - only gets 2 decimal places
    /// ```
    /// Convert 1.234.56 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
