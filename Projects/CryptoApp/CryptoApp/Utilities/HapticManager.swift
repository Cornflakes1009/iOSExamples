//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Harold Davidson on 2/23/25.
//

import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
