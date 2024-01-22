//
//  Numeric+Extensions.swift
//  Cproject
//
//  Created by 최안용 on 1/22/24.
//

import Foundation

extension Numeric {
    var moneyString: String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return (formatter.string(for: self) ?? "") + "원"
    }
}
