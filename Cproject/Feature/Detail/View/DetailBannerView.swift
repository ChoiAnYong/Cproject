//
//  DetailBannerView.swift
//  Cproject
//
//  Created by 최안용 on 1/25/24.
//

import SwiftUI
import Kingfisher

final class DetailBannerViewModel: ObservableObject {
    init(imageUrl: [String]) {
        self.imageUrl = imageUrl
    }
    
    @Published var imageUrl: [String]
}

struct DetailBannerView: View {
    @ObservedObject var viewModel: DetailBannerViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0, content: {
                ForEach(viewModel.imageUrl, id: \.self) { imageUrl in
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
            })
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.never)
    }
}

#Preview {
    DetailBannerView(viewModel: DetailBannerViewModel(imageUrl: [
        "https://picsum.photos/id/1/500/500",
        "https://picsum.photos/id/2/500/500",
        "https://picsum.photos/id/3/500/500",
        "https://picsum.photos/id/4/500/500"]))
}
