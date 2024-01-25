//
//  CPColor.swift
//  Cproject
//
//  Created by 최안용 on 1/20/24.
//

import UIKit
import SwiftUI

enum CPColor { }
 
extension CPColor {
    enum UIKit {
        static var bk: UIColor = UIColor(named: "bk")!
        static var wh: UIColor = UIColor(named: "wh")!
        static var coral: UIColor = UIColor(named: "coral")!
        static var yellow: UIColor = UIColor(named: "yellow")!
        static var keyColorRed: UIColor = UIColor(named: "key-color-red")!
        static var keyColorRed2: UIColor = UIColor(named: "key-color-red-2")!
        static var keyColorBlue: UIColor = UIColor(named: "key-color-blue")!
        static var keyColorBlueTrans: UIColor = UIColor(named: "key-color-blue-trans")!
        
        static var gray0: UIColor = UIColor(named: "gray-0")!
        static var gray1: UIColor = UIColor(named: "gray-1")!
        static var gray2: UIColor = UIColor(named: "gray-2")!
        static var gray3: UIColor = UIColor(named: "gray-3")!
        static var gray3Cool: UIColor = UIColor(named: "gray-3-cool")!
        static var gray4: UIColor = UIColor(named: "gray-4")!
        static var gray5: UIColor = UIColor(named: "gray-5")!
        static var green: UIColor = UIColor(named: "green")!
        static var icon: UIColor = UIColor(named: "icon")!
    }
}

extension CPColor {
    enum SwiftUI {
        static var bk: Color = Color("bk", bundle: nil)
        static var wh: Color = Color( "wh", bundle: nil)
        static var coral: Color = Color( "coral", bundle: nil)
        static var yellow: Color = Color( "yellow", bundle: nil)
        static var keyColorRed: Color = Color( "key-color-red", bundle: nil)
        static var keyColorRed2: Color = Color( "key-color-red-2", bundle: nil)
        static var keyColorBlue: Color = Color( "key-color-blue", bundle: nil)
        static var keyColorBlueTrans: Color = Color( "key-color-blue-trans", bundle: nil)
        
        static var gray0: Color = Color( "gray-0", bundle: nil)
        static var gray1: Color = Color( "gray-1", bundle: nil)
        static var gray2: Color = Color( "gray-2", bundle: nil)
        static var gray3: Color = Color( "gray-3", bundle: nil)
        static var gray3Cool: Color = Color( "gray-3-cool", bundle: nil)
        static var gray4: Color = Color( "gray-4", bundle: nil)
        static var gray5: Color = Color( "gray-5", bundle: nil)
        static var green: Color = Color( "green", bundle: nil)
        static var icon: Color = Color( "icon", bundle: nil)
    }
}
