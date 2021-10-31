//
//  HomeViewModel.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import DefaultNetworkOperationPackage
import UIKit

typealias SearchDataResponseBlock = (Result<SearchDataResponse, ErrorResponse>) -> Void

class HomeViewModel {
    
    private var searchResponseData: SearchDataResponse?
    private var homeViewState: ((ViewState) -> Void)?
    private var homeCategoryState: ((MediaType) -> Void)?
    private var selectedCategory: MediaType = .movies
    private var searchText = ""
    private var dataRequest = SearchDataRequest()
    private var detailViewState: ((Int) -> Void)?
    
    private func getSearchData(with text: String, completion: @escaping SearchDataResponseBlock) {
        homeViewState?(.loading)
        dataRequest.setTerm(term: text)
        dataRequest.setMedia(media: selectedCategory.rawValue)
        do {
            let urlRequest = try SearchServiceProvider(requestData: dataRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private func getSearchDataWithOffset() {
        getSearchData(with: searchText, completion: dataListenerWithOffset)
    }
    
    private func dataHandler(with response: SearchDataResponse) {
        searchResponseData = response
        homeViewState?(.done)
    }
    
    private func dataHandlerWithOffset(with response: SearchDataResponse) {
        searchResponseData?.resultCount += response.resultCount
        searchResponseData?.results.append(contentsOf: response.results)
        homeViewState?(.done)
    }
    
    private func getCollectionDataItem (from data: SearchDataResult) -> MainCollectionContentViewData {
        return MainCollectionContentViewData(imageUrl: data.artworkUrl100, name: data.collectionName ?? data.trackName ?? "", price: data.formattedPrice ?? "$\(data.collectionPrice ?? data.price ?? 0.0)", releaseDate: data.releaseDate ?? data.currentVersionReleaseDate ?? "")
    }
    
    lazy var searchFieldChangeListener: SearchFieldChangeBlock = { [weak self] text in
        self?.searchText = text ?? ""
        if (self?.searchText.count)! > 2 {
            self?.getSearchData(with: self!.searchText, completion: self!.dataListener)
        } else {
            self?.searchResponseData = nil
            self?.homeViewState?(.done)
        }
    }
    
    lazy var categoryChangeListener: CategoryChangeBlock = { [weak self] category in
        self?.selectedCategory = category
        self?.dataRequest.setOffset(offset: 0)
        self?.homeCategoryState?(category)
        self?.getSearchData(with: self?.searchText ?? "", completion: self!.dataListener)
    }
    
    lazy var dataListener: SearchDataResponseBlock = { [weak self] result in
        self?.dataRequest.fetching = false
        switch result {
        case .failure(let error):
            print("error : \(error.localizedDescription)")
        case .success(let response):
            self?.dataHandler(with: response)
        }
    }
    
    lazy var dataListenerWithOffset: SearchDataResponseBlock = { [weak self] result in
        self?.dataRequest.fetching = false
        switch result {
        case .failure(let error):
            print("error : \(error.localizedDescription)")
        case .success(let response):
            self?.dataHandlerWithOffset(with: response)
        }
    }
    
    func subscribeViewState(with completion: @escaping (ViewState) -> Void) {
        homeViewState = completion
    }
    
    func subscribeCategoryChange(with completion: @escaping CategoryChangeBlock) {
        homeCategoryState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping (Int) -> Void) {
        detailViewState = completion
    }
}

// MARK: - MainCollectionViewProtocol
extension HomeViewModel: MainCollectionViewProtocol {
    
    func getNumberOfItem(in section: Int) -> Int {
        guard let data = searchResponseData else { return 0 }
        return data.resultCount
    }
    
    func getData(at index: Int) -> MainCollectionContentViewData? {
        guard let data = searchResponseData else { return nil }
        return getCollectionDataItem(from: data.results[index])
    }
    
    func getMoreData() {
        guard let data = searchResponseData else { return }
        guard dataRequest.checkLoadingMore(control: data.resultCount) else { return }
        dataRequest.incrementOffset()
        getSearchDataWithOffset()
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        guard let data = searchResponseData else { return false }
        return index >= data.resultCount
    }
    
    func selectedItem(at index: Int) {
        guard let data = searchResponseData else { return }
        detailViewState?(data.results[index].trackId)
    }
    
}
