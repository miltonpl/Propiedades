//
//  PageViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class PageViewController: UIPageViewController {
    static let identifier = "ImagePageViewController"
//    var petPhotos: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        dataSource = self
//        if petPhotos.isEmpty {
//            fetchData()
//        }
//        setViewControllers([viewControllerForPage(at: 0)], direction: .forward, animated: false, completion: nil)
    }
    
//    func fetchData() {
//        self.petPhotos.append(UIImage(named: "default1")!)
//        self.petPhotos.append(UIImage(named: "default2")!)
//        self.petPhotos.append(UIImage(named: "default3")!)
//        self.petPhotos.append(UIImage(named: "default4")!)
//
//    }
}

//extension PageViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let viewController = viewController as? PhotoViewController, let pageIndex = viewController.pageIndex, pageIndex > 0 else { return nil }
//        return viewControllerForPage(at: pageIndex)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let viewController = viewController as? PhotoViewController,
//              let pageIndex = viewController.pageIndex, (pageIndex + 1) < petPhotos.count
//              else { return nil }
//        return viewControllerForPage(at: pageIndex + 1)
//    }
//
//    private func viewControllerForPage(at index: Int) -> UIViewController {
//      let cardViewController: PhotoViewController = UIStoryboard(storyboard: .main).instantiateViewController()
//
//      cardViewController.pageIndex = index
//        cardViewController.petImage = petPhotos[index]
//      return cardViewController
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let viewController = pageViewController.viewControllers,
//              let currentVC = viewController.first as? PhotoViewController,
//              let currentPageIndex = currentVC.pageIndex else { return 0 }
//        return currentPageIndex
//    }
//
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return petPhotos.count
//    }
//}
