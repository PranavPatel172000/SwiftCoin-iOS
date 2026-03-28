//
//  TopMoversView.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 19/11/25.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach (viewModel.topMovingCoins) { coin in
                        TopMoversItemsView(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}
