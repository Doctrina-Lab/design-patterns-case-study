//
//  Product.swift
//  ObjectTemplate
//
//  Created by Volodymyr Myroniuk on 08.03.2024.
//

import Foundation

struct Product {
    let name: String
    let description: String
    let price: Double
    let stock: UInt
    
    var stockValue: Double {
        price * Double(stock)
    }
    
    func calculateTax(withRate rate: Double) -> Double {
        price * rate
    }
}
