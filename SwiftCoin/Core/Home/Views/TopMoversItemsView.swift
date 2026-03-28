//
//  TopMoversItemsView.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 19/11/25.
//

import SwiftUI
import Kingfisher

struct TopMoversItemsView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            //Image
            KFImage(URL(string: coin.image)!)
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
        
            //coin info
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //coin percent change
            Text(coin.priceChangePercentage24H?.toDecimal() ?? "0.0")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H ?? 0.0 > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("IconBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1.5)
                
        }
    }
}

//#Preview {
//    TopMoversItemsView()
//}
