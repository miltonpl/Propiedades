//
//  ImageView+Ext.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import UIKit
private let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func setImage(strURL: String) {
        guard let url = getURL(strURL: strURL) else { return }
        let keyCache = strURL as NSString
        
        if let cacheImage = imageCache.object(forKey: keyCache) {
            self.image = cacheImage
        } else {
            downloadImage(url: url, keyCache: keyCache)
        }
    }
    
    func getURL(strURL: String) -> URL? {
        if let url = URL(string: strURL) {
            return url
        }
        return nil
    }
    
    func downloadImage(url: URL, keyCache: NSString) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: keyCache)
                    self.uploadImage(image: image)
                } else {
                    self.uploadImage(image: UIImage(named: "default2"))
                }
                
            } catch {
                self.uploadImage(image: UIImage(named: "default2"))
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    private func uploadImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
