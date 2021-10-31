//
//  DetailViewBuilder.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailViewBuilder {
    
    class func build(trackId: Int, activeViewCategory: Category, activeViewCategoryColor: UIColor?) -> UIViewController {
        let viewModel = DetailViewModel(trackId: trackId, activeViewCategory: activeViewCategory, activeViewCategoryColor: activeViewCategoryColor)
        return DetailViewController(viewModel: viewModel)
    }
    
}
