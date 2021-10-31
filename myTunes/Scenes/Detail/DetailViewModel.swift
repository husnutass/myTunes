//
//  DetailViewModel.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias SearchDataResultBlock = (SearchDataResult) -> Void

class DetailViewModel {
    
    private var dataRequest: DetailDataRequest!
    private var trackId: Int
    private var dataState: SearchDataResultBlock?
    
    init(trackId: Int) {
        self.trackId = trackId
        dataRequest = DetailDataRequest(id: trackId)
        getDetailData(completion: dataResultListener)
    }
    
    private func getDetailData(completion: @escaping SearchDataResponseBlock) {
        do {
            let urlRequest = try DetailServiceProvider(requestData: dataRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private lazy var dataResultListener: SearchDataResponseBlock = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error : \(error.localizedDescription)")
        case .success(let response):
            self?.dataHandler(with: response)
        }
    }
    
    private func dataHandler(with response: SearchDataResponse) {
        dataState?(response.results[0])
    }
    
    func subscribeDataResult(with completion: @escaping SearchDataResultBlock) {
        dataState = completion
    }
    
}
