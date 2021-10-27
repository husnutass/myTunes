//
//  HomeViewController.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private var homeView: HomeView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
    }
    
    private func addComponents() {
        homeView = HomeView()
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        homeView.expandView(to: view)
    }
    
}
