//
//  MainCollectionViewProtocol.swift
//  myTunes
//
//  Created by Hüsnü Taş on 29.10.2021.
//

import Foundation

protocol MainCollectionViewProtocol: AnyObject {
    
    func getNumberOfItem() -> Int
    func getData(at index: Int) -> MainCollectionContentViewData?
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func selectedItem(at index: Int)
    
}
