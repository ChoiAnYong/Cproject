//
//  SplashViewController.swift
//  Cproject
//
//  Created by 최안용 on 1/17/24.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var appIconCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var appIconCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var appIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //좌측 상단으로 이동하는 애니메이션
//        appIconCenterXConstraint.constant = -(view.frame.width / 2) - (appIcon.frame.width / 2)
//        appIconCenterYConstraint.constant = -(view.frame.height / 2) - (appIcon.frame.height / 2)
//        
//        UIView.animate(withDuration: 1) { [weak self] in
//            self?.view.layoutIfNeeded()
//        }
        
        //회전하는 애니메이션
        UIView.animate(withDuration: 3) { [weak self] in
            let rotationAngle: CGFloat = CGFloat.pi
            self?.appIcon.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}
