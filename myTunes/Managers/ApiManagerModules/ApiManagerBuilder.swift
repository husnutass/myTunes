//
//  ApiManagerBuilder.swift
//  myTunes
//
//  Created by Hüsnü Taş on 16.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiManagerBuilder {
    
    private static let loadingView = LoadingViewController()
    private static let listener = ApiCallListenerManager(loadingView: loadingView)
    private static let manager = APIManager(apiCallListener: listener)
    
    class func build() -> APIManagerInterface {
        return manager
    }
    
}
