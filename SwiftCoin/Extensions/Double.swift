//
//  Double.swift
//  SwiftCoin
//
//  Created by pranavashok.patel on 08/12/25.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 2
        return formatter
    }
    
    private var decimalFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter
    }
    
    func toCurrency() -> String {
        guard let currency = currencyFormatter.string(for: self) else {
            return "$0.00"
        }
        return "\(currency)"
    }
    
    func toDecimal() -> String {
        guard let currency = decimalFormatter.string(for: self) else {
            return "0.00"
        }
        return currency + "%"
    }
}
