//
//  MainTabbarView.swift
//  LorcanaPrice
//
//  Created LorcanaSeriesView()by marlon von ansale on 08/09/2024.
//

import SwiftUI
import LorcanaSwiftUI

struct MainTabBarView: View {
    @StateObject var viewModel = MainTabBarViewModel(tabItems:[ CustomTabItemViewModel(image: "gear", order: 0), CustomTabItemViewModel(image: "gear", order: 1)])

    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $viewModel.currentTab.id) {
                LorcanaSeriesView().tag(viewModel.tabItems[0].id)
                LoreCounterView().tag(viewModel.tabItems[1].id)
            }.frame(maxWidth: .infinity)

            CustomTabBar(tabItems: viewModel.tabItems, currentTab: $viewModel.currentTab)
        }
    }
}

#Preview {
    MainTabBarView()
}
