//
//  HomeView.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 19/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                //Top Movers
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                //All coins views
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
