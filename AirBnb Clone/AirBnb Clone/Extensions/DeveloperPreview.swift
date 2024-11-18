//
//  DeveloperPreview.swift
//  AirBnb Clone
//
//  Created by Harold Davidson on 11/17/24.
//

import Foundation

class DeveloperPreview {
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "1104 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.alarmSystem, .wifi, .balcony, .laundry, .tv, .kitchen],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Harold Davidson",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 699,
            latitude: 25.7706,
            longitude: -80.1340,
            imageUrls: ["listing-1", "listing-2", "listing-3", "listing-4"],
            address: "117 Sesame Street",
            city: "Miami",
            state: "Florida",
            title: "Miami Condo",
            rating: 2.4,
            features: [.selfCheckIn, .superHost],
            amenities: [.alarmSystem, .wifi, .balcony, .kitchen],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jesse Pinkman",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 12,
            latitude: 26.7850,
            longitude: -81.1936,
            imageUrls: ["listing-4", "listing-3", "listing-2", "listing-`"],
            address: "203 W Evergreen",
            city: "Ft. Lauderdale",
            state: "Florida",
            title: "Crack House",
            rating: 0.2,
            features: [.selfCheckIn],
            amenities: [.alarmSystem, .tv, .kitchen],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Bob Barker",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 4,
            pricePerNight: 495,
            latitude: 25.1234,
            longitude: -80.1234,
            imageUrls: ["listing-1", "listing-3", "listing-2", "listing-4"],
            address: "495 Cheap Street",
            city: "Miami",
            state: "Florida",
            title: "The Price is Right!",
            rating: 4.9,
            features: [.selfCheckIn, .superHost],
            amenities: [.alarmSystem, .wifi, .balcony, .laundry, .tv, .kitchen],
            type: .townHouse
        ),
    ]
}
