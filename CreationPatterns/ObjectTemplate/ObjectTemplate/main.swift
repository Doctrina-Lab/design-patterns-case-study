//
//  main.swift
//  ObjectTemplate
//
//  Created by Volodymyr Myroniuk on 06.03.2024.
//

import Foundation

let products: [Product] = [
    .init(name: "Kayak", description: "A boat for one person", price: 275.0, stock: 10),
    .init(name: "Lifejacket", description: "Proactive and fashionable", price: 48.95, stock: 14),
    .init(name: "Soccer Ball", description: "FIFA-approved size and weight", price: 19.5, stock: 32)
]

print("Sales tax for Kayak: $\(products.first?.calculateTax(withRate: 0.2) ?? 0.0)")
print("Total value of stock: $\(products.reduce(0) { $0 + $1.stockValue })")
