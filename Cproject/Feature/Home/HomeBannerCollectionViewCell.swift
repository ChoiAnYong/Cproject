//
//  HomeBannerCollectionViewCell.swift
//  Cproject
//
//  Created by 최안용 on 1/20/24.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
