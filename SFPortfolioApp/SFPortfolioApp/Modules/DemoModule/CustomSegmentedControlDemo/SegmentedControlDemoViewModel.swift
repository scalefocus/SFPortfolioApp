//
//  SegmentedControlDemoViewModel.swift
//  SFPortfolioApp
//
//  Created by Milen Valchev on 12.08.21.
//

import Foundation

class SegmentedControlDemoViewModel: SegmentedControlViewModelProtocol {
    
    // MARK: - Publishers
    @Published var selectedTabIndex: Int = 0
    
    // MARK: - Properties
    var tabItems: [TabItemModel] {[
        TabItemModel(id: 0, title: "Light"),
        TabItemModel(id: 1, title: "Dark"),
        TabItemModel(id: 2, title: "Auto")
    ]}
    
    let title = Constants.CategoryItemTitle.customSegmentedControl
    let fullSizeLabel = "Select appearance (full sized): "
    let shrunkLabel = "Select appearance (shrunk): "
    
    // MARK: - Public Functions
    func onTabChange(with selectedIndex: Int) {
        selectedTabIndex = selectedIndex
    }
    
    func isTabSelected(_ tab: TabItemModel) -> Bool {
        selectedTabIndex == tab.id
    }
    
}
