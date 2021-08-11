//
//  ExecutionButtonDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 11.08.21.
//

import Combine
import Foundation

class ExecutionButtonDemoViewModel: ExecutionButtonViewModelProtocol {
    
    // MARK: - Publishers
    @Published var isExecutionButtonLoading: Bool = false
    
    // MARK: - Subjects
    let executionButtonResetSubject = PassthroughSubject<Void, Never>()
    
    // MARK: - Properties
    let title = Constants.CategoryItemTitle.executionButton
    let defaultInfoLabelTitle = "Default:"
    let disabledInfoLabelTitle = "Disabled:"
    let executionText = "Execute Payment"
    let executionButtonState: ExecutionButtonState
    
    // MARK: - Init
    init(executionButtonState: ExecutionButtonState) {
        self.executionButtonState = executionButtonState
    }
    
    // MARK: - Public Functions
    func executionAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.executionButtonResetSubject.send()
        }
    }
    
}
