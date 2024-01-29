//
//  PurchaseViewController.swift
//  Cproject
//
//  Created by 최안용 on 1/26/24.
//

import UIKit
import Combine

final class PurchaseViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: PurchaseViewModel = PurchaseViewModel()
    private var rootView: PurchaseRootView = PurchaseRootView()
    
    override func loadView() {
        view = rootView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        bindViewModel()
        viewModel.process(.loadData)
    }

    private func bindViewModel() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let viewModels = self?.viewModel.state.purchaseItems else { return }
                self?.rootView.setPurchaseItem(viewModels)
            }
            .store(in: &cancellables)
        
        viewModel.showPaymentViewController
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                let paymentViewController: PaymentViewController = PaymentViewController()
                self?.navigationController?.pushViewController(paymentViewController, animated: true)
            }
            .store(in: &cancellables)
    }
}

#Preview {
    PurchaseViewController ()
}
