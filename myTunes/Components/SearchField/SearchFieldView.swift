//
//  SearchFieldView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class SearchFieldView: GenericBaseView<SearchFieldData> {
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 4)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .primary
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return temp
    }()
    
    private lazy var searchFieldIconView: UIView = {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = SFSymbols.magnifyingglass.value
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addSubview(imageView)
        return temp
    }()
    
    private lazy var searchField: UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .primary
        temp.textColor = .white
        temp.clearButtonMode = .whileEditing
        temp.tintColor = .white
        temp.leftView = searchFieldIconView
        temp.leftViewMode = .unlessEditing
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        searchField.attributedPlaceholder = NSAttributedString(string: data.placeHolder, attributes: [.foregroundColor : UIColor.white])
    }
    
    private func addComponents() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            shadowContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        containerView.expandView(to: shadowContainer)
        searchField.expandView(to: containerView, top: 10, bottom: -10, leading: 4, trailing: -4)
    }
    
}
