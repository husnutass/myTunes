//
//  DetailViewBuilder.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = DetailViewModel()
        return DetailViewController(viewModel: viewModel)
    }
    
}
