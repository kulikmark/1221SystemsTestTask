//
//  ProductItem.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import Foundation

enum BadgeType: String {
    case discounted = "Удар по ценам"
    case new = "Новинки"
    case cardPrice = "Цена по карте"
}

enum Unit: String {
    case kilogram = "кг"
    case piece = "шт"
}

struct ProductItem: Identifiable, Hashable {
    let id = UUID()
    let itemName: String
    let imageName: String
    let price: Double
    let unit: Unit
    let oldPrice: Double?
    let rating: Double
    let badgeType: BadgeType?
    let saleLabel: String?
    let country: String?
    let comments: Int?
    
    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Используем уникальный идентификатор для хэширования
    }
    
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.id == rhs.id // Сравниваем объекты по уникальному идентификатору
    }
}
