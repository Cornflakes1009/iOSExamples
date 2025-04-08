//
//  String.swift
//  CryptoApp
//
//  Created by Harold Davidson on 3/6/25.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
