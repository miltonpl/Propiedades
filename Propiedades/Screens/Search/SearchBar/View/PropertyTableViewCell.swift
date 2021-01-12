//
//  PropertyTableViewCell.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    static let identifier = "PropertyTableViewCell"
    
    @IBOutlet private weak var streetLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var bathsLabel: UILabel!
    @IBOutlet private weak var bedsLabel: UILabel!
    @IBOutlet private weak var squareFtLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    static func nib() -> UINib {
        return UINib(nibName: "PropertyTableViewCell", bundle: nil)
    }
    
    func configure(image: Image) {
        self.streetLabel.text = "SteetA"
        self.cityLabel.text = "City A"
        self.bathsLabel.text = "2"
        self.bedsLabel.text = "4"
        self.priceLabel.text = "$ 3000.000"
    }
}
