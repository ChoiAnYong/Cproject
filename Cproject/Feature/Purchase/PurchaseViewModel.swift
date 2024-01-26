//
//  PurchaseViewModel.swift
//  Cproject
//
//  Created by 최안용 on 1/26/24.
//

import Foundation

final class PurchaseViewModel: ObservableObject {
    enum Action {
        case loadData
        case didTapPurchaseButton
    }
    
    struct State {
        var purchaseItems: [PurchaseSelectedItemViewModel]?
    }
    
    private(set) var state: State = State()
    func process(_ action: Action) {
        switch action {
        case .loadData:
            break
        case .didTapPurchaseButton:
            break
        }
    }
}
