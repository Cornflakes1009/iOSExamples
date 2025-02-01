//
//  IAPManager.swift
//  BrightSky
//
//  Created by Harold Davidson on 1/15/25.
//

import RevenueCat
import Foundation

final class IAPManager {
    static let shared = IAPManager()
    
    private init() {}
    
    func isSubscribed(completion: @escaping (Bool) -> Void) {
        Purchases.shared.getCustomerInfo { info, error in
            guard let subscriptions = info?.activeSubscriptions else { return }
            print(subscriptions)
            completion(subscriptions.isEmpty)
        }
    }
}
