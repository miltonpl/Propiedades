//
//  FavoriteViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class FavoriteViewController: UIViewController {
    @IBOutlet private weak var contentView: UIView!
    var petPhotos: [UIImage] = []
    var currentViewController = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
        self.configurePageViewController()
    }
    
    func configurePageViewController() {
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: PageViewController.identifier) as? PageViewController else { return }
        pageViewController.delegate = self
        pageViewController.dataSource = self
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(pageViewController.view)
        let views: [String: Any] = ["pageView": pageViewController.view]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: views))
        let startingViewController = self.viewControllerForPage(at: self.currentViewController)
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension FavoriteViewController {
    
    func fetchData() {
        self.petPhotos.append(UIImage(named: "default1")!)
        self.petPhotos.append(UIImage(named: "default2")!)
        self.petPhotos.append(UIImage(named: "default3")!)
        self.petPhotos.append(UIImage(named: "default4")!)
    }
    
}

extension FavoriteViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PhotoViewController, let pageIndex = viewController.pageIndex, pageIndex > 0 else { return nil }
        self.currentViewController = pageIndex
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
        return self.currentViewController
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return petPhotos.count
    }
}

extension FavoriteViewController: UIPageViewControllerDelegate {
    
}
