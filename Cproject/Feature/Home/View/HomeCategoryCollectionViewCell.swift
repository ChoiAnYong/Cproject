//
//  HomeCategoryCollectionViewCell.swift
//  Cproject
//
//  Created by 최안용 on 1/24/24.
//

import UIKit

struct HomeCategoryCollectionViewCellViewModel: Hashable {
    let image: UIImage
    let title: String
}

final class HomeCategoryCollectionViewCell: UICollectionViewCell {
    static let reusableId: String = "HomeCategoryCollectionViewCell"
    
    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var categoryTitle: UILabel! {
        didSet {
            categoryTitle.textAlignment = .center
        }
    }
    
    func setViewModel(_ viewModel: HomeCategoryCollectionViewCellViewModel) {
        categoryImage.image = viewModel.image
        categoryTitle.text = viewModel.title
    }
}

extension HomeCategoryCollectionViewCell {
    static func categoryItemLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 4), heightDimension: .estimated(80))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(186))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(25)
        
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.interGroupSpacing = 25
        section.contentInsets = .init(top: 53, leading: 30, bottom: 13, trailing: 30)
    
        return section
    }

}
