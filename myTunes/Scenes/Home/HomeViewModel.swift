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
    private var collectionScrollState: (VoidBlock)?
    
    // MARK: - API Call
    private func getSearchData(completion: @escaping SearchDataResponseBlock) {
        guard searchText.count > 2 else {
            resetSearch()
            return
        }
        homeViewState?(.loading)
        dataRequest.setTerm(term: searchText)
        dataRequest.setMedia(media: selectedCategory.rawValue)
        do {
            let urlRequest = try SearchServiceProvider(requestData: dataRequest).returnUrlRequest()
            ApiManagerBuilder.build().executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private func getSearchDataWithOffset() {
        getSearchData(completion: dataListenerWithOffset)
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
    
    private func resetSearch() {
        searchResponseData = nil
        dataRequest.setOffset(offset: 0)
        homeViewState?(.done)
    }
    
    // MARK: - Listeners
    lazy var searchFieldChangeListener: SearchFieldChangeBlock = { [weak self] text in
        self?.collectionScrollState?()
        self?.resetSearch()
        self?.searchText = text ?? ""
        self?.getSearchData(completion: self!.dataListener)
    }
    
    lazy var categoryChangeListener: CategoryChangeBlock = { [weak self] category in
        self?.collectionScrollState?()
        self?.resetSearch()
        self?.selectedCategory = category
        self?.homeCategoryState?(category)
        self?.getSearchData(completion: self!.dataListener)
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
    
    // MARK: - Subscribables
    func subscribeViewState(with completion: @escaping (ViewState) -> Void) {
        homeViewState = completion
    }
    
    func subscribeCategoryChange(with completion: @escaping CategoryChangeBlock) {
        homeCategoryState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping (Int) -> Void) {
        detailViewState = completion
    }
    
    func subscribeCollectionScroll(with completion: @escaping VoidBlock) {
        collectionScrollState = completion
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
