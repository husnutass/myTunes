//
//  GenericBaseView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 26.10.2021.
//

import UIKit

class GenericBaseView<T>: BaseView {
    
    private var data: T?
    
    init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadViewData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadViewData() {}
    
    func setData(by value: T?) {
        self.data = value
        loadViewData()
    }
    
    func returnData() -> T? {
        return data
    }
    
}
