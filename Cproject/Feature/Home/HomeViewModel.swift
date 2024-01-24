//
//  HomeViewModel.swift
//  Cproject
//
//  Created by 최안용 on 1/22/24.
//
import Combine
import Foundation
import UIKit

final class HomeViewModel {
    enum Action {
        case loadData
        case loadCoupon
        case getDataSuccess(HomeResponse)
        case getDataFailure(Error)
        case getCouponSuccess(Bool)
        case didTapCouponButton
    }
    
    final class State {
        struct CollectionViewModels{
            var bannerViewModels: [HomeBannerCollectionViewCellViewModel]?
            var horizontalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var categoryViewModels: [HomeCategoryCollectionViewCellViewModel]? = [
                    .init(image: UIImage(resource: .category1Big), title: "패션"),
                    .init(image: UIImage(resource: .category2Big), title: "식품"),
                    .init(image: UIImage(resource: .category3Big), title: "생활용품"),
                    .init(image: UIImage(resource: .category4Big), title: "가전디지털"),
                    .init(image: UIImage(resource: .category5Big), title: "스포츠"),
                    .init(image: UIImage(resource: .category6Big), title: "애완용품"),
                    .init(image: UIImage(resource: .category7Big), title: "파티용품"),
                    .init(image: UIImage(resource: .category8Big), title: "가구")
            ]
            var verticalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var couponState: [HomeCouponButtonCollectionViewCellViewModel]?
            var separateLine1ViewModels: [HomeSeparateLineCollectionViewCellViewModel] = [HomeSeparateLineCollectionViewCellViewModel()]
            var separateLine2ViewModels: [HomeSeparateLineCollectionViewCellViewModel] = [HomeSeparateLineCollectionViewCellViewModel()]
            var themeViewModels: ( headerViewModel: HomeThemeHeaderCollectionReusableViewModel, items: [HomeThemeCollectionViewCellViewModel])?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    private let couponDownloadedKey: String = "CouponDownloaded"
    
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .loadCoupon:
            loadCoupon()
        case let .getDataSuccess(response):
            transformResponse(response)
        case let .getDataFailure(error):
            print("network error: \(error)")
        case let .getCouponSuccess(isDownloaded):
            Task { await transformCoupon(isDownloaded) }
        case .didTapCouponButton:
            downloadCoupon()
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension HomeViewModel {
    private func loadData() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getHomeData()
                process(action: .getDataSuccess(response))
            } catch {
                process(action: .getDataFailure(error))
            }
        }
    }
    
    private func loadCoupon() {
        let couponState: Bool = UserDefaults.standard.bool(forKey: couponDownloadedKey)
        process(action: .getCouponSuccess(couponState))
    }
    
    private func transformResponse(_ response: HomeResponse) {
        Task { await transformBanner(response) }
        Task { await transformHorizontalProduct(response) }
        Task { await transformVerticalProduct(response) }
        Task { await transformTheme(response) }
    }
    
    @MainActor
    private func transformBanner(_ response: HomeResponse) async {
        state.collectionViewModels.bannerViewModels = response.banners.map {
            HomeBannerCollectionViewCellViewModel(bannerImageUrl: $0.imageUrl)
        }
    }
    
    @MainActor
    private func transformHorizontalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.horizontalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.horizontalProducts)
    }
    
    @MainActor
    private func transformVerticalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.verticalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.verticalProducts)
    }

    @MainActor
    private func transformTheme(_ response: HomeResponse) async {
        let items = response.themes.map {
            HomeThemeCollectionViewCellViewModel(themImageUrl: $0.imageUrl)
        }
        state.collectionViewModels.themeViewModels = (HomeThemeHeaderCollectionReusableViewModel(headerText: "테마관"), items)
    }
    
    private func productToHomeProductCollectionViewCellViewModel(_ product: [Product]) -> [HomeProductCollectionViewCellViewModel] {
        return product.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl,
                                                   title: $0.title,
                                                   reasonDiscountString: $0.discount,
                                                   originalPrice: $0.originalPrice.moneyString,
                                                   discountPrice: $0.discountPrice.moneyString)
        }
    }
    
    @MainActor
    private func transformCoupon(_ isDownloaded: Bool) {
        state.collectionViewModels.couponState = [.init(state: isDownloaded ? .disable : .enable)]
    }
    
    private func downloadCoupon() {
        UserDefaults.standard.setValue(true, forKey: couponDownloadedKey)
        process(action: .loadCoupon)
    }
}
