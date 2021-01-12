//
//  PhotoViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class PhotoViewController: UIViewController {
    static let identifier = "PhotoViewController"

    @IBOutlet private weak var petImageView: UIImageView!
    private var tappedGesture: UITapGestureRecognizer!
    var pageIndex: Int?
    var petImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("vie Didload: \(String(describing: PhotoViewController.self))")
        petImageView.image = self.petImage
        self.tappedGesture = UITapGestureRecognizer(target: self.petImageView, action: #selector(handleTappedGesture(_:)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.segueIdentifier(for: segue) == .reveal,
           let destinationViewController = segue.destination as? DetailsViewController {
            destinationViewController.petName = "Osito"
            destinationViewController.petImage = self.petImage
        }
    }
    
    @IBAction func handleTap() {
        self.performSegue(withIdentifier: .reveal, sender: nil)
        print("tapped")
    }
    @objc func handleTappedGesture(_ sender: UITapGestureRecognizer) {
        print("tapped")
    }
}

extension PhotoViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case reveal
    }
}
