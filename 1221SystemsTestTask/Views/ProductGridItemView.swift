//
//  ProductGridItemView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import SwiftUI

struct ProductGridItemView: View {
    var productItem: ProductItem
    
    @State private var isFavorite: Bool = false
    @State private var isBasketExpanded: Bool = false
    
    @State private var quantity: Double = 0
    
    @EnvironmentObject var basketManager: BasketManager
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    Image(productItem.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, minHeight: 148, maxHeight: 168)
                        .clipped()
                    
                    if let badgeType = productItem.badgeType {
                        Text(badgeType.rawValue)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(badgeColor(for: badgeType))
                            .foregroundColor(.white)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomRight])
                            .padding([.top, .leading], 0)
                    }
                }
                
                HStack {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                        Text(String(format: "%.1f", productItem.rating))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    Text(productItem.saleLabel ?? "")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(red: 195/255, green: 35/255, blue: 35/255, alpha: 1.0)))
                        .padding(.horizontal, 5)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(productItem.itemName)
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                        .padding(.horizontal, 8)
                        .foregroundColor(Color(UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 0.8)))
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text(productItem.country ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(Color(UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 0.6)))
                    }
                    .padding(.top, 10)
                    .padding(.leading, 8)
                }
                
                Spacer(minLength: 50)
                
                if !isBasketExpanded {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack(spacing: 2) {
                                let formattedPrice = String(format: "%.2f", productItem.price)
                                let integerPart = formattedPrice.split(separator: ".").first ?? "0"
                                let decimalPart = formattedPrice.split(separator: ".").last ?? "00"

                                Text("\(integerPart)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)

                                Text("\(decimalPart)")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)

                                Text("₽")
                                    .font(.system(size: 10))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .offset(x: 9, y: -4)

                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 17, height: 1.4)
                                    .rotationEffect(.degrees(-45))

                                Text(productItem.unit.rawValue)
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .offset(x: -9, y: 4)
                            }
                            
                            if let oldPrice = productItem.oldPrice {
                                Text("\(String(format: "%.2f", oldPrice)) ₽")
                                    .font(.system(size: 12))
                                    .strikethrough()
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.bottom, 4)
                        
                        Spacer()
                        
                        Button(action: {
                            isBasketExpanded.toggle()
                            if isBasketExpanded {
                                quantity = productItem.unit == .piece ? 1 : 0.1
                                basketManager.addItem(productItem, quantity: quantity)
                            }
                        }) {
                            Image("basket")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding()
                                .background(Color(UIColor(red: 21/255, green: 183/255, blue: 66/255, alpha: 1.0)))
                                .frame(width: 48, height: 36)
                                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                                .padding(.bottom, 4)
                        }
                    }
                    .padding(.horizontal, 4)
                } else {
                    Button(action: {
                        if quantity <= 0 {
                            basketManager.removeItem(productItem)
                            isBasketExpanded = false
                        } else {
                            basketManager.addItem(productItem, quantity: quantity)
                        }
                    }) {
                        HStack {
                            Button(action: {
                                if quantity > 0 {
                                    quantity -= step(for: productItem.unit)
                                    if quantity <= 0 {
                                        basketManager.removeItem(productItem)
                                        isBasketExpanded = false
                                    } else {
                                        basketManager.addItem(productItem, quantity: quantity)
                                    }
                                }
                            }) {
                                Image(systemName: "minus")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 5) {
                                Text(String(format: quantity == floor(quantity) ? "%.0f %@" : "%.1f %@", quantity, productItem.unit.rawValue))
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Text(String(format: "%.2f ₽", quantity * productItem.price))
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                            
                            Spacer()
                            
                            Button(action: {
                                quantity += step(for: productItem.unit)
                                basketManager.addItem(productItem, quantity: quantity)
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                            }
                        }
                        .background(Color(UIColor(red: 21/255, green: 183/255, blue: 66/255, alpha: 1.0)))
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .padding(.horizontal, 4)
                        .padding(.bottom, 4)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
            
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 8) {
                    Button(action: {
                        // Navigate to the order list
                    }) {
                        Image("order_list_icon")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(isFavorite ? "heart_icon_fill" : "heart_icon")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                }
                .frame(width: 32, height: 64)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding([.top, .trailing], 0)
            }
        }
        .environmentObject(BasketManager.shared)
    }
    
    private func badgeColor(for badgeType: BadgeType) -> Color {
        switch badgeType {
        case .discounted:
            return Color(UIColor(red: 252/255, green: 106/255, blue: 106/255, alpha: 0.90))
        case .new:
            return Color(UIColor(red: 122/255, green: 121/255, blue: 186/255, alpha: 0.90))
        case .cardPrice:
            return Color(UIColor(red: 91/255, green: 205/255, blue: 123/255, alpha: 0.90))
        }
    }
    
    private func step(for unit: Unit) -> Double {
        switch unit {
        case .piece:
            return 1.0
        case .kilogram:
            return 0.1
        }
    }
}



// MARK: - Расширение для закругленных углов
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - Класс для закругления углов
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
