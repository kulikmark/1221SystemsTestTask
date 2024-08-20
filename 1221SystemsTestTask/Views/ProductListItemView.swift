//
//  ProductListItemView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import SwiftUI

struct ProductListItemView: View {
    let productItem: ProductItem
    
    var body: some View {
        HStack {
            Image(productItem.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(productItem.itemName)
                    .font(.headline)
                Text("\(String(format: "%.2f", productItem.price)) ₽/\(productItem.unit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if let oldPrice = productItem.oldPrice {
                Text("\(String(format: "%.2f", oldPrice)) ₽")
                    .font(.subheadline)
                    .strikethrough()
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

//struct ProductListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Создаем продукт для предварительного просмотра
//        ProductListItemView(productItem: ProductItem(name: "Сыр Ламбер 500/0 230г", imageName: "cheese", price: 99.90, oldPrice: 199.0, rating: 4.1, isDiscounted: true, unit: "кг"))
//    }
//}
