//
//  SplashViewController.swift
//  Cproject
//
//  Created by 최안용 on 1/17/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet weak var lottieAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lottieAnimationView.play()
    }
}
