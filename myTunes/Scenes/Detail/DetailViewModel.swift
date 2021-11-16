//
//  DetailViewModel.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit
import DefaultNetworkOperationPackage

typealias SearchDataResultBlock = (SearchDataResult) -> Void

class DetailViewModel {
    
    private var dataRequest: DetailDataRequest!
    private var trackId: Int
    private var dataState: SearchDataResultBlock?
    var activeViewCategory: Category
    var activeViewCategoryColor: UIColor?
    
    init(trackId: Int, activeViewCategory: Category, activeViewCategoryColor: UIColor?) {
        self.trackId = trackId
        self.activeViewCategory = activeViewCategory
        self.activeViewCategoryColor = activeViewCategoryColor
        
        dataRequest = DetailDataRequest(id: trackId)
        getDetailData(completion: dataResultListener)
    }
    
    // MARK: - API Call
    private func getDetailData(completion: @escaping SearchDataResponseBlock) {
        do {
            let urlRequest = try DetailServiceProvider(requestData: dataRequest).returnUrlRequest()
            ApiManagerBuilder.build().executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private func dataHandler(with response: SearchDataResponse) {
        dataState?(response.results[0])
    }
    
    // MARK: - Listeners
    private lazy var dataResultListener: SearchDataResponseBlock = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error : \(error.localizedDescription)")
        case .success(let response):
            self?.dataHandler(with: response)
        }
    }
    
    // MARK: - Subscribables
    func subscribeDataResult(with completion: @escaping SearchDataResultBlock) {
        dataState = completion
    }
    
}
