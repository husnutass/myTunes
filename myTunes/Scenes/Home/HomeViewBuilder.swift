//
//  HomeViewBuilder.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = HomeViewModel()
        return HomeViewController(viewModel: viewModel)
    }
    
}
