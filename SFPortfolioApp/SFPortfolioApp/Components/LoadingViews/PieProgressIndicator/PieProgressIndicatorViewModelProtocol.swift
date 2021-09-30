//
//  PieProgressIndicatorViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 29.09.21.
//

import Combine

/// Describes the needed implementation for `PieProgressIndicatorView` component.
protocol PieProgressIndicatorViewModelProtocol: ObservableObject {
    
    /// Value for indicating current progress.
    var progress: Double { get }
    
    /// Value for indicating loading completion.
    var isFinished: Bool { get }
    
    /// Starts indicating the progress.
    func start()
    
}
