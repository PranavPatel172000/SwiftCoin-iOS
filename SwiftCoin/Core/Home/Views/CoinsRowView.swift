//
//  CoinsRowView.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 01/12/25.
//

import SwiftUI
import Kingfisher

struct CoinsRowView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack{
            // market cap rank
            Text("\(String(describing: coin.marketCapRank))")
                .font(.caption)
                .foregroundColor(.gray)
            
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.orange)
            
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // coin price info
            VStack(alignment: .trailing){
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.athChangePercentage.toDecimal())
                    .font(.caption)
                    .foregroundColor(coin.athChangePercentage > 0 ? .green : .red)
                    .padding(.leading, 6)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinsRowView(coin: Coin)
//}
