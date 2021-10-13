//
//  AsymmetricCollectionSettingsViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 5.08.21.
//

import SFBaseKit

protocol AsymmetricCollectionSettingsViewModelProtocol: CoordinatableViewModel {
    
    /// Value for number of cell per row on portait.
    var numberOfCellsPerRow: Float { get set }
    
    /// Value for padding of cell.
    var cellPadding: Float { get set }
    
    /// Value for width to height size ratio of cell.
    var sizeRatio: Float { get set }
    
    /// Value for vertical offset of cell.
    var verticalOffset: Float { get set }
    
    /// Request finish scene when play button is tapped.
    func didSelectPlay()
    
}
