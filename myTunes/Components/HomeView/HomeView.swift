//
//  HomeView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeView: GenericBaseView<HomeViewData> {
    
    weak var delegate: MainCollectionViewProtocol?
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .background
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [searchFieldView, mainCategoryView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        temp.spacing = 20
        return temp
    }()
    
    private lazy var searchFieldView: SearchFieldView = {
        let temp = SearchFieldView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return temp
    }()
    
    private lazy var mainCategoryView: MainCategoryView = {
        let temp = MainCategoryView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var collectionView: MainCollectionView = {
        let temp = MainCollectionView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func setupViewConfigurations() {
        addPanGesture()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        searchFieldView.setData(by: data.searchFieldData)
        mainCategoryView.setData(by: data.mainCategoryViewData)
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        containerView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func reloadCollectionView() {
        collectionView.reloadCollectionView()
    }
    
    func setEmptyHomeViewData(by data: EmptyHomeViewData) {
        collectionView.setEmptyHomeViewData(by: data)
    }
    
    func scrollCollectionToTop() {
        collectionView.scrollCollectionToTop()
    }
    
}

// MARK: - MainCollectionViewProtocol
extension HomeView: MainCollectionViewProtocol {
    
    func getNumberOfItem() -> Int {
        delegate?.getNumberOfItem() ?? 0
    }
    
    func getData(at index: Int) -> MainCollectionContentViewData? {
        delegate?.getData(at: index)
    }
    
    func getMoreData() {
        delegate?.getMoreData()
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        guard let delegate = delegate else { return false }
        return delegate.isLoadingCell(for: index)
    }
    
    func selectedItem(at index: Int) {
        delegate?.selectedItem(at: index)
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension HomeView: UIGestureRecognizerDelegate {
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: .homeViewInteractionSelector)
    
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @objc fileprivate func homeViewInteracted(_ sender: UIGestureRecognizer) {
        self.searchFieldView.removeFocus()
    }
    
}

fileprivate extension Selector {
    static let homeViewInteractionSelector = #selector(HomeView.homeViewInteracted)
}
