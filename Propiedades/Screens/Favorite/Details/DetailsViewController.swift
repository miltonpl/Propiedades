//
//  DetailsViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    var petImage: UIImage?
    var petName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLable.text = petName
        self.imageView.image = petImage
    }
    @IBAction func dismissAction(_ sender: UIButton) {
        print("dismiss")
        self.dismiss(animated: true, completion: nil)
    }
}
