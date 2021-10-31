//
//  DetailViewBuilder.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailViewBuilder {
    
    class func build(trackId: Int) -> UIViewController {
        let viewModel = DetailViewModel(trackId: trackId)
        return DetailViewController(viewModel: viewModel)
    }
    
}
