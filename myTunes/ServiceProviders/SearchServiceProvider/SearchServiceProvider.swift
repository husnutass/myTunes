//
//  SearchServiceProvider.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class SearchServiceProvider: ApiServiceProvider<SearchDataRequest> {
    
    init(requestData: SearchDataRequest) {
        super.init(method: .get, baseUrl: BaseUrl.dev.rawValue, path: Path.search.rawValue, data: requestData)
    }
    
}
