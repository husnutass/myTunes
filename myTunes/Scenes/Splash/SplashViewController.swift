//
//  SplashViewController.swift
//  myTunes
//
//  Created by Hüsnü Taş on 26.10.2021.
//

import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.backgroundColor = .background
        return temp
    }()
    
    private lazy var appLogo: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.image = .logo
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
        viewModel.fireApplicationInitiateProcess()
    }
    
    
    private func addComponents() {
        view.addSubview(containerView)
        containerView.addSubview(appLogo)
        
        containerView.expandView(to: view)
        appLogo.centerView(to: containerView)
    }
    
}
