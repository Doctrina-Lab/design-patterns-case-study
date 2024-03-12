//
//  Utils.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 11.03.2024.
//

import Foundation

struct Utils {
    private init() {}
    
    static func currencyString(from number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(floatLiteral: number)) ?? ""
    }
}
