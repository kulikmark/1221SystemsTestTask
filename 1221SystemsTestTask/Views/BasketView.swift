//
//  BasketView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 20.08.2024.
//

import SwiftUI

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basketManager: BasketManager
    
    var body: some View {
        List {
            // Преобразование словаря в массив пар (productItem, quantity)
            ForEach(basketManager.items.keys.sorted(by: { $0.itemName < $1.itemName }), id: \.id) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.itemName)
                        
                        // Отображение общей цены за все количество товара
                        if let quantity = basketManager.items[item] {
                            let totalPrice = item.price * quantity
                            Text(String(format: "%.2f ₽", totalPrice))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    
                    // Отображение количества товара
                    if let quantity = basketManager.items[item] {
                        Text(formatQuantity(quantity, unit: item.unit))
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Basket")
        .navigationBarItems(trailing: EditButton())
    }
    
    // Функция для форматирования количества товара
    private func formatQuantity(_ quantity: Double, unit: Unit) -> String {
        if quantity == floor(quantity) {
            return String(format: "%.0f %@", quantity, unit.rawValue) // Отображение целого числа
        } else {
            return String(format: "%.1f %@", quantity, unit.rawValue) // Отображение дробного числа
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(BasketManager.shared)
    }
}
