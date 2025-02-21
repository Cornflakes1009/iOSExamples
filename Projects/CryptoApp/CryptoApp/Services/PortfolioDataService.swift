//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Harold Davidson on 2/19/25.
//

import Foundation
import CoreData

class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entity: String = "PortfolioEntity" // this comes from the entity name in CoreData. Look at PortfolioContainer in Models
    @Published var savedEntities: [PortfolioEntitiy] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data!", error)
            }
        }
    }
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntitiy>(entityName: entity)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching Portfolio Entities:", error)
        }
    }
}
