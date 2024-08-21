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
                .listRowInsets(EdgeInsets()) // Убирает отступы от границ экрана
        }
        .listStyle(PlainListStyle()) // PlainListStyle, чтобы убрать отступы
    }
}
