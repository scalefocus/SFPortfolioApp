//
//  SegmentedControlViewModel.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 9.08.21.
//

import Foundation

/// Protocol defining needed functionality for handling a segmented control.
protocol SegmentedControlViewModelProtocol: ObservableObject {
    
    /// The index of the currently selected tab.
    var selectedTabIndex: Int { get }
    
    /// List of segmented control items.
    var tabItems: [TabItemModel] { get }
    
    /// Executed when a tab is selected and changed.
    func onTabChange(with selectedIndex: Int)
    
    /// Checks whether a specific tab is currently selected or not.
    func isTabSelected(_ tab: TabItemModel) -> Bool
    
}
