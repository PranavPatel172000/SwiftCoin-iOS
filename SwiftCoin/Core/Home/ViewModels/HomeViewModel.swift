//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 01/12/25.
//

import Foundation
import Combine

enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case otherError(Error)
}

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var topMovingCoins: [Coin] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData()  {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&price_change_percentage=30d&order=market_cap_desc"
        guard let url = URL(string: urlString) else {
            return
         }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw ApiError.invalidResponse
                }
                return data
            }
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error:" , error)
                }
            },
                receiveValue: { [weak self] coins in
                    self?.coins = coins
                    self?.getTopMovingCoins()
                    print("COINS:- \(coins)")
                    print("COINS Count:- \(coins.count)")
                }
            )
            .store(in: &cancellables)
    }
    
    func getTopMovingCoins() {
        let coins = coins.sorted(by: { $0.priceChangePercentage24H ?? 0.0 > $1.priceChangePercentage24H ?? 0.0})
        self.topMovingCoins = Array(coins.prefix(5))
    }
}
