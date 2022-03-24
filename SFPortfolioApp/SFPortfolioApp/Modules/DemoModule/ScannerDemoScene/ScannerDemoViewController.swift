//
//  ScannerDemoViewController.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 8.10.21.
//

import SFBaseKit

class ScannerDemoViewController: BaseViewController {
    
    // MARK: - Properties
    private var scannerView: ScannerView?
    private var viewModel: ScannerDemoViewModelProtocol!
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scannerContainer: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupScanner()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scannerView?.startScan()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        scannerView?.stopScan()
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Private Functions
    private func setupNavigationBar() {
        title = viewModel.title
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupScanner() {
        scannerView = ScannerView.create(delegate: viewModel)
        scannerView?.expand(in: scannerContainer)
        scannerView?.setup()
    }
    
    private func setupBinding() {
        viewModel.infoText.sink { [weak self] text in
            self?.resultLabel.text = text
        }
    }
    
}

// MARK: - Instantiate
extension ScannerDemoViewController {
    
    static func create(viewModel: ScannerDemoViewModelProtocol) -> UIViewController {
        let viewController = ScannerDemoViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
