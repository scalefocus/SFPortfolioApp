//
//  BaseHostingController.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import SwiftUI

/// Base implementation of `UIHostingController`.
///
/// Any common logic used for `UIHostingController` can be placed and added here
/// or it can be used in case catching a lifecycle method is needed through exposing a publisher.
class BaseHostingController<Content: View>: UIHostingController<Content> {
    
    // MARK: - Properties
    private let navigationBarHidden: Bool
    
    // MARK: - Init
    init(rootView: Content, navigationBarHidden: Bool = false) {
        self.navigationBarHidden = navigationBarHidden
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = navigationBarHidden
    }
    
}
