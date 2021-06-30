//
//  CategoryViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 2.07.21.
//

import SFBaseKit

protocol CategoryViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    /// Notifies the Coordinator about the action.
    /// - Parameter index: Index of the selected category.
    func selectCategory(at index: Int)
    
}
