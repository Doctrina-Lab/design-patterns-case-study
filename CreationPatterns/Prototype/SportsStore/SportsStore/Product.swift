//
//  Product.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 11.03.2024.
//

import Foundation

final class Product: NSObject, NSCopying {
    let name: String
    let descriptionString: String
    let category: String
    var stockLevel: UInt
    let price: Double
    var stockValue: Double { price * Double(stockLevel) }
    
    init(name: String, descriptionString: String, category: String, stockLevel: UInt, price: Double) {
        self.name = name
        self.descriptionString = descriptionString
        self.category = category
        self.stockLevel = stockLevel
        self.price = max(1, price)
        
        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        Product(name: name, descriptionString: descriptionString, category: category, stockLevel: stockLevel, price: price)
    }
}
