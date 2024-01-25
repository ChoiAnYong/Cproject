//
//  DetailPriceView.swift
//  Cproject
//
//  Created by 최안용 on 1/25/24.
//

import SwiftUI

final class DetailPriceViewModel: ObservableObject {
    init(discountRate: String, originPrice: String, currentPrice: String, shippingType: String) {
        self.discountRate = discountRate
        self.originPrice = originPrice
        self.currentPrice = currentPrice
        self.shippingType = shippingType
    }
    
    @Published var discountRate: String
    @Published var originPrice: String
    @Published var currentPrice: String
    @Published var shippingType: String
}

struct DetailPriceView: View {
    @ObservedObject var viewModel: DetailPriceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21, content: {
            VStack(alignment: .leading, spacing: 6, content: {
                HStack(spacing: 0, content: {
                    Text(viewModel.discountRate)
                        .font(CPFont.SwiftUI.b14)
                        .foregroundStyle(CPColor.SwiftUI.icon)
                    Text(viewModel.originPrice)
                        .font(CPFont.SwiftUI.b16)
                        .strikethrough()
                        .foregroundStyle(CPColor.SwiftUI.gray5)
                })
                Text(viewModel.currentPrice)
                    .font(CPFont.SwiftUI.b20)
                    .foregroundStyle(CPColor.SwiftUI.keyColorRed)
            })
            Text(viewModel.shippingType)
                .font(CPFont.SwiftUI.r12)
                .foregroundStyle(CPColor.SwiftUI.icon)
        })
    }
}

#Preview {
    DetailPriceView(viewModel: DetailPriceViewModel(discountRate: "53%",
                                                    originPrice: "300,000원",
                                                    currentPrice: "139,000원",
                                                    shippingType: "무료배송"))
}
