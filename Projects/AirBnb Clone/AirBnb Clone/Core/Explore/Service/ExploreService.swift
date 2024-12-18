//
//  ExploreService.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/17/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
