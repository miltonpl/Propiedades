//
//  CustomPageViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/10/21.
//

import UIKit
import SDWebImage
class CustomPageViewController: UIPageViewController {
    static let identifier = "CustomPageViewController"
    var petPhotos: [UIImage] = []
    var data: [UIImage]?
    var strURL: String? {
        didSet {
            self.downloadImages(strURL: strURL)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = self.data {
            self.petPhotos = data
        } else {
            // Add default image
        }
        setupUI()
    }
    
    func downloadImages(strURL: String?) {
        SDWebImageManager.shared.loadImage(with: URL(string: strURL ?? ""), options: .highPriority, progress: nil) { image, _, _, _, isFinished, _ in
            if isFinished, let image = image {
                self.petPhotos.append(image)
                print("isFinished")
            }
        }
    }
    
    func setupUI() {
        dataSource = self
        setViewControllers([viewControllerForPage(at: 0)], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Dispose of any resuouce that can be recreated
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CustomPageViewController: UIPageViewControllerDataSource {
    override func viewDidLayoutSubviews() {
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            } else if subView is UIPageControl {
                self.view.bringSubviewToFront(subView)
            }
        }
        
        super.viewDidLayoutSubviews()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PhotoViewController, let pageIndex = viewController.pageIndex, pageIndex > 0 else { return nil }
        return viewControllerForPage(at: pageIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PhotoViewController,
              let pageIndex = viewController.pageIndex, (pageIndex + 1) < petPhotos.count
        else { return nil }
        return viewControllerForPage(at: pageIndex + 1)
    }
    
    private func viewControllerForPage(at index: Int) -> UIViewController {
        let cardViewController: PhotoViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        
        cardViewController.pageIndex = index
        cardViewController.petImage = petPhotos[index]
        return cardViewController
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let viewController = pageViewController.viewControllers,
              let currentVC = viewController.first as? PhotoViewController,
              let currentPageIndex = currentVC.pageIndex else { return 0 }
        return currentPageIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return petPhotos.count
    }
}
