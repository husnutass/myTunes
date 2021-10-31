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
        addViewModelListeners()
    }
    
    private func addComponents() {
        homeView = HomeView()
        setHomeViewData()
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        homeView.delegate = viewModel
        
        homeView.expandView(to: view)
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.homeView.reloadCollectionView()
            default:
                break
            }
        }
        
//        viewModel.subscribeDetailViewState { [weak self] data in
//            self?.fireDetailView(with: data)
//        }
        
        viewModel.subscribeCategoryChange { [weak self] category in
            let emptyHomeViewCategory: Category
            let emptyHomeViewCategoryColor: UIColor?
            switch category {
            case .movies:
                emptyHomeViewCategory = .movies
                emptyHomeViewCategoryColor = .movies
            case .music:
                emptyHomeViewCategory = .music
                emptyHomeViewCategoryColor = .music
            case .apps:
                emptyHomeViewCategory = .apps
                emptyHomeViewCategoryColor = .apps
            case .books:
                emptyHomeViewCategory = .books
                emptyHomeViewCategoryColor = .books
            }
            self?.homeView.setEmptyHomeViewData(by: EmptyHomeViewData(category: emptyHomeViewCategory, categoryColor: emptyHomeViewCategoryColor))
        }
    }
    
    private func setHomeViewData() {
        homeView.setData(by: HomeViewData(searchFieldData: SearchFieldData(placeHolder: "Search", leftIcon: SFSymbols.magnifyingglass.value).setSearchFieldChangeListener(by: viewModel.searchFieldChangeListener), mainCategoryViewData: MainCategoryViewData(movies: MainCategoryItemViewData(categoryColor: .movies, categoryImage: .movies, categoryName: Category.movies.rawValue, categoryType: .movies), music: MainCategoryItemViewData(categoryColor: .music, categoryImage: .music, categoryName: Category.music.rawValue, categoryType: .music), apps: MainCategoryItemViewData(categoryColor: .apps, categoryImage: .apps, categoryName: Category.apps.rawValue, categoryType: .apps), books: MainCategoryItemViewData(categoryColor: .books, categoryImage: .books, categoryName: Category.books.rawValue, categoryType: .books)).setCategoryChangeListener(by: viewModel.categoryChangeListener)))
    }
    
}
