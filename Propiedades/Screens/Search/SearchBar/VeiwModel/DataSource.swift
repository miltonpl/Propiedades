//
//  DataSource.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import UIKit
protocol DataSourceProtocol: AnyObject {
    func loadTableView(photos: [Image])
    func showLoading()
    func hideLoading()
    func errorLoadingData(error: NetworkLayerError)
}

class DataSource: NSObject {
    public weak var delegate: DataSourceProtocol?
    private var parseData: ParseData
    
    init(parseData: ParseData  = ParseData(network: NetworkLayer())) {
        self.parseData = parseData
        super.init()
    }
    
    public func fetchData(query: String) {
        self.delegate?.showLoading()
        self.parseData.parseData(type: Splash.self, query: query) { result in
            switch result {
            case .success(let splash):
                if let images = splash.images {
                    self.delegate?.loadTableView(photos: images)
                    self.delegate?.hideLoading()
                    
                } else {
                    self.delegate?.hideLoading()
                }
            case .failure(let error):
                self.delegate?.errorLoadingData(error: error)
                self.delegate?.hideLoading()
            }
        }
    }
}
