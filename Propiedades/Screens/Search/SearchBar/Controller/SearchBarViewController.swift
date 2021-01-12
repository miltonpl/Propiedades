//
//  SearchBarViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import UIKit
import RealmSwift
import SDWebImage
class SearchBarViewController: UIViewController {
    @IBOutlet weak var savedButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.rowHeight = 400.0
            self.tableView.register(PropertyTableViewCell.nib(), forCellReuseIdentifier: PropertyTableViewCell.identifier)
        }
    }
    
    private var searchBar: UISearchBar! {
        didSet {
            self.searchBar.delegate = self
            self.searchBar.placeholder = "City, Address, Place"
            self.searchBar.showsCancelButton = true
        }
    }
    private var photos: [Image] = []
    private var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addTapGesture()
        self.adjustFontSizeIfNeeded()
        print("view frame with: ", view.frame.width)
        let pet = Pet()
        pet.name = "Ositon"
        pet.gender = "Male"
        pet.color = "White Light.dark"
        
        do {
            let realm = try Realm()
            print("fileURL- \(realm.configuration.fileURL?.absoluteString ?? "NO File URL")")
            try realm.write {
                realm.add(pet)
            }
        } catch {
            print("error - \(error.localizedDescription)")
            
        }
        
        self.dataSource = DataSource()
        self.dataSource?.delegate = self
        self.dataSource?.fetchData(query: "House")
        self.searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 40))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.searchBar)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-list"), style: .plain, target: self, action: #selector(tappedAction(_:)))
    }
    
    @objc func tappedAction(_ sender: UIBarButtonItem) {
        print("SearchBar View Controller")
        self.navigationItem.rightBarButtonItem = nil
        self.searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        self.searchBar.placeholder = "City, Address, Place"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.searchBar)
    }
    
    @IBAction func filterAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if #available(iOS 13.0, *) {
            guard let filterViewController = storyboard.instantiateViewController(identifier: "FilterViewController") as? FilterViewController else {
                return
            }
//            let transition = CATransition()
//            transition.duration = 0.5
//            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            transition.type = CATransitionType.push
//            transition.subtype = CATransitionSubtype.fromTop
//            self.navigationController?.view.layer.add(transition, forKey: kCATransition)
//            self.navigationController?.pushViewController(filterViewController, animated: false)
            self.present(filterViewController, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
            guard let filterViewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController else {
                return
            }
//            let navController = UINavigationController(rootViewController: filterViewController)
//            self.navigationController?.present(navController, animated: true, completion: nil)
            self.present(filterViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func sortAction(_ sender: UIButton) {
        
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
    }
    
    func adjustFontSizeIfNeeded() {
        self.filterButton.layer.borderColor = UIColor.lightGray.cgColor
        self.filterButton.layer.borderWidth = 1.0
        self.sortButton.layer.borderColor = UIColor.lightGray.cgColor
        self.sortButton.layer.borderWidth = 1.0
        
        if self.view.frame.width < 375.0 {
            self.savedButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
            self.filterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
            self.sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        }
    }
}

extension SearchBarViewController: UISearchBarDelegate {
    // return NO to not become first responder
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
//    {
//
//    }
    // called when text starts editing
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Start ->")
        
    }
    // return NO to not resign first responder
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//
//    }
    // called when text ends editing
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }

    // called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
    }
    // called before text changes
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }

    // called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("keyboard search button pressed")
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) // called when bookmark button pressed
    {}
    // called when cancel button pressed
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel button pressed")
        searchBar.text = nil
        self.searchBar.endEditing(true)
    }
    // called when search results button pressed
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("search results button pressed")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
}

extension SearchBarViewController: DataSourceProtocol {
    func loadTableView(photos: [Image]) {
        print("loadTableView")
        self.photos = photos
        self.tableView.reloadData()
    }
    
    func showLoading() {
        print("show Loading....")
    }
    
    func hideLoading() {
        print("hide Loading...")
    }
    
    func errorLoadingData(error: NetworkLayerError) {
        print("error - \(error.localizedDescription)")
    }
    
    func fetchData() -> [UIImage]? {
        var images: [UIImage] = []
        images.append(UIImage(named: "default1")!)
        images.append(UIImage(named: "default2")!)
        images.append(UIImage(named: "default3")!)
        images.append(UIImage(named: "default4")!)
        print("return")
        return images
    }
    
}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = self.tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as? PropertyTableViewCell else {
            fatalError("Unable to dequeue tableView with Identifier: PropertyTableViewCell")
        }
        cell.configure(image: self.photos[indexPath.row])
                
        if let pageViewContoller = self.pageViewController() {
            pageViewContoller.strURL = self.photos[indexPath.row].url
            pageViewContoller.data = self.fetchData()
            addChild(pageViewContoller)
            pageViewContoller.view.frame = cell.containerView.bounds
            pageViewContoller.didMove(toParent: self)
            cell.containerView.addSubview(pageViewContoller.view)
        }
        
        return cell
    }
    
    func pageViewController() -> CustomPageViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let pageViewController = storyboard.instantiateViewController(withIdentifier: CustomPageViewController.identifier) as? CustomPageViewController else { return nil }
        
        return pageViewController
    }
}
