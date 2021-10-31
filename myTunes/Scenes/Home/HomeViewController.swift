//
//  HomeViewController.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private var homeView: HomeView!
    private var activeViewCategory: Category?
    private var activeViewCategoryColor: UIColor?
    
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
    
    private func openDetailView(trackId: Int) {
        navigationController?.pushViewController(DetailViewBuilder.build(trackId: trackId, activeViewCategory: activeViewCategory ?? .movies, activeViewCategoryColor: activeViewCategoryColor), animated: true)
    }
    
    private func addViewModelListeners() {
        // Listens data state changes, if done, reloads the collectionView
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
        
        // Navigation to detail view
        viewModel.subscribeDetailViewState { [weak self] data in
            DispatchQueue.main.async {
                self?.openDetailView(trackId: data)
            }
        }
        
        // Listens main category changes
        viewModel.subscribeCategoryChange { [weak self] category in
            switch category {
            case .movies:
                self?.activeViewCategory = .movies
                self?.activeViewCategoryColor = .movies
            case .music:
                self?.activeViewCategory = .music
                self?.activeViewCategoryColor = .music
            case .apps:
                self?.activeViewCategory = .apps
                self?.activeViewCategoryColor = .apps
            case .books:
                self?.activeViewCategory = .books
                self?.activeViewCategoryColor = .books
            }
            self?.homeView.setEmptyHomeViewData(by: EmptyHomeViewData(category: self?.activeViewCategory ?? .movies, categoryColor: self?.activeViewCategoryColor))
        }
        
        // Listens for scrolling collectionView to top
        viewModel.subscribeCollectionScroll { [weak self] in
            DispatchQueue.main.async {
                self?.homeView.scrollCollectionToTop()
            }
        }
    }
    
    /// Sets data for the homeView components
    private func setHomeViewData() {
        homeView.setData(by: HomeViewData(searchFieldData: SearchFieldData(placeHolder: "Search", leftIcon: SFSymbols.magnifyingglass.value).setSearchFieldChangeListener(by: viewModel.searchFieldChangeListener), mainCategoryViewData: MainCategoryViewData(movies: MainCategoryItemViewData(categoryColor: .movies, categoryImage: .movies, categoryName: Category.movies.rawValue, categoryType: .movies), music: MainCategoryItemViewData(categoryColor: .music, categoryImage: .music, categoryName: Category.music.rawValue, categoryType: .music), apps: MainCategoryItemViewData(categoryColor: .apps, categoryImage: .apps, categoryName: Category.apps.rawValue, categoryType: .apps), books: MainCategoryItemViewData(categoryColor: .books, categoryImage: .books, categoryName: Category.books.rawValue, categoryType: .books)).setCategoryChangeListener(by: viewModel.categoryChangeListener)))
    }
    
}
