//
//  BasketView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 20.08.2024.
//

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
                        Text(String(format: "%.2f ₽", item.price))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(String(format: "%.1f %@", basketManager.items[item] ?? 0.0, item.unit.rawValue))
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Basket")
        .navigationBarItems(trailing: EditButton())
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(BasketManager.shared)
    }
}
