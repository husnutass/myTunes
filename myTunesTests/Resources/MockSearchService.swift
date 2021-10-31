//
//  MockSearchService.swift
//  myTunesTests
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
@testable import myTunes

class MockSearchService {
    
    private var dataRequest = SearchDataRequest()
    
    func getEmptySearchData(completion: @escaping SearchDataResponseBlock) {
        do {
            let urlRequest = try SearchServiceProvider(requestData: dataRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    func getSearchData(completion: @escaping SearchDataResponseBlock) {
        do {
            dataRequest.setTerm(term: "bad")
            let urlRequest = try SearchServiceProvider(requestData: dataRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
}
