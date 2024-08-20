//
//  ListView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import SwiftUI

struct ListView: View {
    let products: [ProductItem]
    
    var body: some View {
        List(products) { product in
            ProductListItemView(productItem: product)
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Создаем список продуктов для предварительного просмотра
////        let products = [
////            ProductItem(name: "Сыр Ламбер 500/0 230г", imageName: "cheese", price: 99.90, oldPrice: 199.0, rating: 4.1, isDiscounted: true, unit: "кг"),
////            ProductItem(name: "Энергетический Напиток", imageName: "energy_drink", price: 95699.90, oldPrice: 199.0, rating: 4.1, isDiscounted: false, unit: "шт")
////        ]
//        
////        ListView(products: products)
//    }
//}
