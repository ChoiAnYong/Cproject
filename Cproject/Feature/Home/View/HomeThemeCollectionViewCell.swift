//
//  HomeThemeCollectionViewCell.swift
//  Cproject
//
//  Created by 최안용 on 1/23/24.
//

import Kingfisher
import UIKit

struct HomeThemeCollectionViewCellViewModel: Hashable {
    let themImageUrl: String
}

final class HomeThemeCollectionViewCell: UICollectionViewCell {
    static let reusableId: String = "HomeThemeCollectionViewCell"
    
    @IBOutlet private weak var themeImageView: UIImageView!
    
    func setViewModel(_ viewModel: HomeThemeCollectionViewCellViewModel) {
        themeImageView.kf.setImage(with: URL(string: viewModel.themImageUrl))
    }
}

extension HomeThemeCollectionViewCell {
    static func themeLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupFractionalWidth: CGFloat = 0.7
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .fractionalWidth((142 / 286) * groupFractionalWidth))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 35, leading: 0, bottom: 0, trailing: 0)
        
        let headerSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(65)) 
        let header: NSCollectionLayoutBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        return section
    }
}
