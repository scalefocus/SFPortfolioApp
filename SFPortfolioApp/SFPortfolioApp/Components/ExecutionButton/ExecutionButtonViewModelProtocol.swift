//
//  ExecutionButtonViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 10.08.21.
//

import Combine

/// Describes the needed implementation for `ExecutionButton` component.
protocol ExecutionButtonViewModelProtocol: ObservableObject {
    
    /// Use this subject to reset the button to it's initial state.
    var executionButtonResetSubject: PassthroughSubject<Void, Never> { get }
    
    /// Use this to track when the component is loading.
    var isExecutionButtonLoading: Bool { get set }
    
    /// The text to display within the button.
    var executionText: String { get }
    
    /// The current state of the button.
    var executionButtonState: ExecutionButtonState { get }
    
    /// The action to be performed by the button.
    func executionAction()
    
}

/// Default implementation of `ExecutionButtonViewModelProtocol`.
extension ExecutionButtonViewModelProtocol {
    
    var executionButtonState: ExecutionButtonState {
        .default
    }
    
}
