//
//  Logger.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 06.04.2024.
//

import Foundation

final class Logger<T> {
    private var items = [T]()
    private let callback: (T) -> Void
    
    init(callback: @escaping (T) -> Void) {
        self.callback = callback
    }
    
    func logItem(_ item: T) {
        items.append(item)
        callback(item)
    }
    
    func processItems(callback: (T) -> Void) {
        items.forEach(callback)
    }
}
