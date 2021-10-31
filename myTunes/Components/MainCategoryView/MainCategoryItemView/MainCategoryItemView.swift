//
//  MainCategoryItemView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class MainCategoryItemView: GenericBaseView<MainCategoryItemViewData> {
    
    weak var delegate: MainCategoryView?
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var categoryItemStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [shadowContainer,categoryNameLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
        return temp
    }()
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var imageContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.layer.borderWidth = 4
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var categoryNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.font = .setFont(fontType: .bold, size: 18)
        temp.textColor = .white
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func setupViewConfigurations() {
        addTapGesture()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        imageView.image = data.categoryImage
        categoryNameLabel.text = data.categoryName
        if data.categoryType == .movies {
            selectCategory()
        }
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(categoryItemStackView)
        shadowContainer.addSubview(imageContainerView)
        imageContainerView.addSubview(imageView)
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth/4)-25
        
        NSLayoutConstraint.activate([
            shadowContainer.heightAnchor.constraint(equalToConstant: itemWidth),
            shadowContainer.widthAnchor.constraint(equalToConstant: itemWidth)
        ])
        
        containerView.expandView(to: self)
        categoryItemStackView.expandView(to: containerView)
        imageContainerView.expandView(to: shadowContainer)
        imageView.expandView(to: imageContainerView)
    }
    
    private func selectCategory() {
        guard let data = returnData() else { return }
        delegate?.returnData()?.categoryChangeListener?(data.categoryType)
        delegate?.resetCategoryBorderColors()
        imageContainerView.layer.borderColor = data.categoryColor?.cgColor
    }
    
    func resetBorderColor() {
        imageContainerView.layer.borderColor = UIColor.background?.cgColor
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension MainCategoryItemView: UIGestureRecognizerDelegate {
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func categoryTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { finish in
            if finish {
                self.isUserInteractionEnabled = true
                self.selectCategory()
            }
        }
    }
}

fileprivate extension Selector {
    static let buttonTappedSelector = #selector(MainCategoryItemView.categoryTapped)
}
