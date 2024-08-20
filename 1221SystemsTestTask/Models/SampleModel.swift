//
//  SampleModel.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

// SampleModel.swift


import Foundation

let sampleProducts: [ProductItem] = [
    
    ProductItem(
        itemName: "Энергетический Напиток Black Monster",
        imageName: "energy_drink",
        price: 95699.90,
        unit: .piece,
        oldPrice: 199.0,
        rating: 4.9,
        badgeType: nil,
        saleLabel: "25%",
        country: "США 🇺🇸"
    ),
    
    // Цена по карте
    ProductItem(
        itemName: "Молоко «Простоквашино» 1л",
        imageName: "milk_prostokvashino",
        price: 89.90,
        unit: .piece, 
        oldPrice: 109.0,
        rating: 4.3,
        badgeType: .cardPrice,
        saleLabel: "50%", country: "Россия 🇷🇺"
    ),
    
    // Продукт со скидкой
    ProductItem(
        itemName: "Сыр Ламбер 500/0 230г",
        imageName: "lamber_cheese",
        price: 99.90,
        unit: .kilogram,
        oldPrice: 199.0,
        rating: 4.1,
        badgeType: .discounted,
        saleLabel: nil,
        country: "Франция 🇫🇷"
    ),
    
    // Продукт со скидкой
    ProductItem(
        itemName: "Хлеб Бородинский 500г",
        imageName: "borodinsky_bread",
        price: 59.90,
        unit: .piece, 
        oldPrice: 79.0,
        rating: 4.6,
        badgeType: .discounted,
        saleLabel: nil, country: "Россия 🇷🇺"
    ),
    
    // Новинка
    ProductItem(
        itemName: "Кофе Jacobs Kronung 500г",
        imageName: "jacobs_coffee",
        price: 399.90,
        unit: .piece, 
        oldPrice: nil,
        rating: 4.5,
        badgeType: .new,
        saleLabel: nil, country: "Германия 🇩🇪"
    ),
    
    // Новинка
    ProductItem(
        itemName: "Сок Апельсиновый 1л",
        imageName: "orange_juice",
        price: 129.90,
        unit: .piece, 
        oldPrice: nil,
        rating: 4.2,
        badgeType: .new,
        saleLabel: "10%", country: "Испания 🇪🇸"
    )
]
