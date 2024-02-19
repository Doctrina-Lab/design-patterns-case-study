//
//  ProductTableCell.swift
//  SportsStore
//
//  Created by Volodymyr Myroniuk on 19.02.2024.
//

import UIKit

class ProductTableCell: UITableViewCell {
    @IBOutlet private(set) weak var nameLabel: UILabel!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var stockStepper: UIStepper!
    @IBOutlet private(set) weak var stockField: UITextField!
}
