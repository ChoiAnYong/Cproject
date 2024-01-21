//
//  HomeProductCollectionViewCell.swift
//  Cproject
//
//  Created by 최안용 on 1/21/24.
//

import UIKit

struct HomeProductCollectionViewCellViewModel: Hashable {
    let imageUrlString: String
    let title: String
    let reasonDiscountString: String
    let originalPrice: String
    let discountPrice: String
}

class HomeProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView! {
        didSet {
            productImageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var productTitleLabel: UILabel!  
    @IBOutlet weak var productReasonDiscountLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    
    func setViewModel(_ viewModel: HomeProductCollectionViewCellViewModel) {
//        productImageView.image =
        productTitleLabel.text = viewModel.title
        productReasonDiscountLabel.text = viewModel.reasonDiscountString
        originalPriceLabel.attributedText = NSMutableAttributedString(string: viewModel.originalPrice, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue]) // 텍스트 중간에 선을 긋어주는 부분
        
        discountPriceLabel.text = viewModel.discountPrice
    }
}
