//
//  BasketManager.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 20.08.2024.
//

import SwiftUI

import SwiftUI

class BasketManager: ObservableObject {
    static let shared = BasketManager()
    
    @Published var items: [ProductItem: Double] = [:]
    
    func addItem(_ item: ProductItem, quantity: Double) {
            if quantity > 0 {
                items[item] = quantity
            } else {
                items.removeValue(forKey: item)
            }
        }
        
        func removeItem(_ item: ProductItem) {
            items.removeValue(forKey: item)
        }
        
        func uniqueItemCount() -> Int {
            return items.count
        }
    
//    func totalQuantity() -> Double {
//        let total = items.values.reduce(0, +)
//        print("Total quantity: \(total)")
//        return total
//    }
}
