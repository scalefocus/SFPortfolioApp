//
//  AsymmetricCollectionSettingsViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 5.08.21.
//

import SFBaseKit

protocol AsymmetricCollectionSettingsViewModelProtocol: CoordinatableViewModel {
    
    /// Sets new value for number of cell per row on portait.
    func changeNumberOfCellsPerRow(_ value: Float)
    
    /// Sets new value for padding of cell.
    func changeCellPadding(_ value: Float)
    
    /// Sets new value for width to height size ratio of cell.
    func changeCellSizeRatio(_ value: Float)
    
    /// Sets new value for vertical offset of cell.
    func changeCellVerticalOffset(_ value: Float)
    
}
