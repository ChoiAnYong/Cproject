//
//  PurchaseViewController.swift
//  Cproject
//
//  Created by 최안용 on 1/26/24.
//

import UIKit

final class PurchaseViewController: UIViewController {
    private var viewModel: PurchaseViewModel = PurchaseViewModel()
    private var scrollViewConstraints: [NSLayoutConstraint]?
    private var titleLabelConstraints: [NSLayoutConstraint]?
    private var purchaseItemStackViewConstraints: [NSLayoutConstraint]?
    
    
    private var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titlelabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "주문 상품 목록"
        label.font = CPFont.UIKit.m17
        label.textColor = CPColor.UIKit.bk
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var purchaseItemStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
    }
    
    override func updateViewConstraints() {
        if scrollViewConstraints == nil {
            let constraints = [
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            scrollViewConstraints = constraints
        }
        
        if titleLabelConstraints == nil, let superView = titlelabel.superview {
            let constraints = [
                titlelabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 33),
                titlelabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 33),
                titlelabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        
        if purchaseItemStackViewConstraints == nil, let superView = purchaseItemStackView.superview {
            let constraints = [
                purchaseItemStackView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 19),
                purchaseItemStackView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
                purchaseItemStackView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
                purchaseItemStackView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constraints)
            titleLabelConstraints = constraints
        }
        
        super.updateViewConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titlelabel)
        containerView.addSubview(purchaseItemStackView)
        purchaseItemStackView
    }
}

#Preview {
    PurchaseViewController ()
}
