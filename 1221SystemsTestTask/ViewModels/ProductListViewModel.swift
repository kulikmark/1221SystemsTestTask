//
//  ProductListViewModel.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductItem] = []
    @Published var isGridView: Bool = true
    @Published var cartItems: [ProductItem] = []

    
    init() {
        self.products = self.loadMockProducts()
    }
    
    func loadMockProducts() -> [ProductItem] {
        products = sampleProducts
        return products
    }
    
    func toggleView() {
        isGridView.toggle()
    }
    
    func addToCart(product: ProductItem) {
        cartItems.append(product)
    }
}
