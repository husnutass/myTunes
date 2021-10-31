//
//  MainCollectionView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import UIKit

class MainCollectionView: GenericBaseView<MainCollectionViewData> {
    
    weak var delegate: MainCollectionViewProtocol?
    
    private var emptyHomeView: EmptyHomeView!
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        temp.backgroundColor = .background
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupEmptyHomeView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        collectionView.expandView(to: self)
    }
    
    private func setupEmptyHomeView() {
        emptyHomeView = EmptyHomeView(data: EmptyHomeViewData(category: .movies, categoryColor: .movies))
        collectionView.backgroundView = emptyHomeView
    }
    
    private func isEmptyCollectionView() -> Bool {
        return (delegate?.getNumberOfItem(in: 0) ?? 0) > 0
    }
    
    private func hideEmptyHomeView() {
        if isEmptyCollectionView() {
            self.emptyHomeView.isHidden = true
        } else {
            self.emptyHomeView.isHidden = false
        }
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.hideEmptyHomeView()
            self.collectionView.reloadData()
        }
    }
    
    func setEmptyHomeViewData(by data: EmptyHomeViewData) {
        emptyHomeView.setData(by: data)
    }
    
    func scrollCollectionToTop() {
        collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate?.getNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = delegate?.getData(at: indexPath.row) else { fatalError("Please provide data") }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { fatalError("Please provide cell") }
        cell.setData(with: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        if delegate.isLoadingCell(for: indexPath.row + 1) {
            delegate.getMoreData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedItem(at: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 60) / 2
        return CGSize(width: width, height: 250)
    }
}
