//
//  Product.swift
//  Cproject
//
//  Created by 최안용 on 1/24/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
