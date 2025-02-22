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
            self.getPortfolio()
        }
    }
    
    // MARK: - PUBLIC
    func updatePortfolio(coin: CoinModel, amount: Double) {
        // check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    // MARK: - PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntitiy>(entityName: entity)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching Portfolio Entities:", error)
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntitiy(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntitiy, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntitiy) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data:", error)
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
