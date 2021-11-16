//
//  ApiCallListenerManager.swift
//  myTunes
//
//  Created by Hüsnü Taş on 16.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import UIKit

class ApiCallListenerManager: ApiCallListener {
    
    private let loadingView: LoadingViewController
    
    init(loadingView: LoadingViewController) {
        self.loadingView = loadingView
    }
    
    private func presentLoading() {
        guard let topViewController = UIApplication.topViewController() else { return }
        topViewController.view.addSubview(loadingView.view)
    }
    
    func onPreExecute() {
        DispatchQueue.main.async { [weak self] in
            self?.presentLoading()
        }
    }
    
    func onPostExecute() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.removeLoading()
        }
    }
    
}
