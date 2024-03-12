//
//  Product.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 11.03.2024.
//

import Foundation

final class Product {
    let name: String
    let description: String
    let category: String
    var stockLevel: UInt
    let price: Double
    var stockValue: Double { price * Double(stockLevel) }
    
    init(name: String, description: String, category: String, stockLevel: UInt, price: Double) {
        self.name = name
        self.description = description
        self.category = category
        self.stockLevel = stockLevel
        self.price = max(1, price)
    }
}
