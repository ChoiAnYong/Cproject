//
//  HomeBannerCollectionViewCell.swift
//  Cproject
//
//  Created by 최안용 on 1/20/24.
//

import UIKit

struct HomeBannerCollectionViewCellViewModel: Hashable {
    let bannerImage: UIImage
}

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setViewModel(_ viewModel: HomeBannerCollectionViewCellViewModel) {
        imageView.image = viewModel.bannerImage
    }
}
