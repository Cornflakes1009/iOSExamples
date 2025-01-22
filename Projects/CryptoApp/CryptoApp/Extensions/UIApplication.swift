//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/21/25.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
