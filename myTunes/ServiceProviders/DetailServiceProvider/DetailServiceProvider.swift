//
//  DetailServiceProvider.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class DetailServiceProvider: ApiServiceProvider<DetailDataRequest> {
    
    init(requestData: DetailDataRequest) {
        super.init(method: .get, baseUrl: BaseUrl.dev.rawValue, path: Path.detail.rawValue, data: requestData)
    }
    
}
