//
//  ContentView.swift
//  1221SystemsTestTask
//
//  Created by Марк Кулик on 19.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductListViewModel()

    let basketManager = BasketManager.shared
    
    var body: some View {
        NavigationView {
            ProductListView(viewModel: viewModel)
                .environmentObject(basketManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
