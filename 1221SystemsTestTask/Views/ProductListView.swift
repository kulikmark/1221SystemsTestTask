//
//  ProductListView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    @EnvironmentObject var basketManager: BasketManager
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // Кнопка для переключения видов
                    Button(action: {
                        viewModel.toggleView()
                    }) {
                        Image(viewModel.isGridView ? "grid_icon" : "list_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.green)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                    
                    // Кнопка перехода в корзину
                    NavigationLink(destination: BasketView()) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .foregroundColor(.green)
                                .font(.system(size: 24, weight: .bold))
                            
                            if basketManager.uniqueItemCount() > 0 {
                                Text(String(basketManager.uniqueItemCount()))
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 4, y: -8)
                            }
                        }
                    }
                    .padding(.trailing, 8)
                }
                .padding(.top)
                
                // Тонкая серая линия на всю ширину экрана
                Divider()
                    .background(Color.gray.opacity(0.4))
                
                // Карточки товаров
                if viewModel.isGridView {
                    GridView(products: viewModel.products)
                } else {
                    ListView(products: viewModel.products)
                }
            }
        }
    }
}


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductListViewModel()
        ProductListView(viewModel: viewModel)
            .environmentObject(BasketManager.shared)
            .previewLayout(.sizeThatFits)
    }
}
