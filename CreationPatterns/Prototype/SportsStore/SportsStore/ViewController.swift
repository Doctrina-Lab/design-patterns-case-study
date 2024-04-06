//
//  ViewController.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var totalStockLabel: UILabel!
    
    private let logger = Logger<Product> { product in
        print("Change: \(product.name) \(product.stockLevel) items in stock")
    }
    
    var products = [
        Product(name: "Kayak", descriptionString: "A boat for one person", category: "Watersports", stockLevel: 10, price: 275.0),
        Product(name: "Lifejacket", descriptionString: "Protective and fashionable", category: "Watersports", stockLevel: 14, price: 48.95),
        Product(name: "Soccer Ball", descriptionString: "FIFA-approved size and weight", category: "Soccer", stockLevel: 32, price: 19.5),
        Product(name: "Corner Flags", descriptionString: "Give your playing field a professional touch", category: "Soccer", stockLevel: 1, price: 34.95),
        Product(name: "Stadium", descriptionString: "Flat-packed 35,000-seat stadium", category: "Soccer", stockLevel: 4, price: 79500.0),
        Product(name: "Thinking Cap", descriptionString: "", category: "Improve your brain efficiency by 75%", stockLevel: 8, price: 16.0),
        Product(name: "Unsteady Chair", descriptionString: "Secretly give your opponent a disadvantage", category: "Chess", stockLevel: 3, price: 29.95),
        Product(name: "Human Chess Board", descriptionString: "", category: "A fun game for the family", stockLevel: 2, price: 75.0),
        Product(name: "Bling-Bling King", descriptionString: "Gold-plated, diamond-studded King", category: "Chess", stockLevel: 4, price: 1200.0)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
    }

    private func displayStockTotal() {
        let finalTotals = products.reduce((0, 0.0)) {
            ($0.0 + $1.stockLevel, $0.1 + $1.stockValue)
        }
        totalStockLabel.text = "\(finalTotals.0) Products in Stock. Total Value: \(Utils.currencyString(from: finalTotals.1))"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableCell
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.descriptionString
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = "\(product.stockLevel)"
        cell.onStepperValueChanged = { [weak self, weak product, weak cell] value in
            guard let product = product, let cell = cell else { return }
            product.stockLevel = UInt(value)
            cell.stockStepper.value = Double(product.stockLevel)
            cell.stockField.text = "\(product.stockLevel)"
            self?.logger.logItem(product)
        }
        return cell
    }
}
