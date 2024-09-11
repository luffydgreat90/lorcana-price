//
//  MainTabBarViewModel.swift
//  LorcanaPrice
//
//  Created by marlon von ansale on 11/09/2024.
//

import SwiftUI
import LorcanaSwiftUI

final class MainTabBarViewModel: ObservableObject {
    @Published var currentTab: CustomTabItemViewModel
    var tabItems: [CustomTabItemViewModel]

    init(tabItems: [CustomTabItemViewModel]) {
        self.currentTab = tabItems.first!
        self.tabItems = tabItems
    }
}
