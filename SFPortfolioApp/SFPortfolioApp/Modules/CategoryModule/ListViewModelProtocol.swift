//
//  CategoryViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 2.07.21.
//

import SFBaseKit

protocol ListViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    /// Title to configure the view with.
    var title: String { get }
    
}
