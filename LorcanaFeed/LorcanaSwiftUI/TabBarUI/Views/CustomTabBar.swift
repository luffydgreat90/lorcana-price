//
//  CustomTabBar.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 01/09/2024.
//

import SwiftUI

public struct CustomTabBar: View {
    @State private var tabItems: [CustomTabItemViewModel]
    @State private var yOffset: CGFloat = 0
    @Binding private var currentTab: CustomTabItemViewModel

    public init(
        tabItems: [CustomTabItemViewModel],
        currentTab: Binding<CustomTabItemViewModel>
    ) {
        self.tabItems = tabItems
        self._currentTab = currentTab
    }

    public var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0){
                ForEach(tabItems) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            currentTab = tab
                            yOffset = -60
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)){
                            yOffset = 0
                        }
                    } label: {
                        Image(systemName: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .blue :  .gray)
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }
                }
            }.frame(maxWidth: .infinity)
             .background(alignment: .leading) {
                 Circle()
                     .fill(.yellow)
                    .frame(width: 25, height: 25)
                    .offset(x: 30,y: yOffset)
                    .offset(x: indicatorOffset(width: geometry.size.width))

            }
        }.frame(height: 30)
            .padding(.bottom,10)
            .padding(.bottom,10)
            .padding([.horizontal,.top])
    }

    private func indicatorOffset(width: CGFloat)->CGFloat{
        let index = CGFloat(currentTab.order)
        if index == 0 {return 0}

        let buttonWidth = width / CGFloat(tabItems.count)

        return index * buttonWidth
    }

}

#Preview {
    struct Preview: View {
            @State var currentTab = ModelCreator.makeCustomTabItemViewModel(image: "play.slash", order: 0)
            var body: some View {
                CustomTabBar(tabItems: [currentTab, ModelCreator.makeCustomTabItemViewModel(image: "play.fill", order: 1), ModelCreator.makeCustomTabItemViewModel(image: "gear", order: 2)], currentTab: $currentTab)
            }
        }

    return Preview()
}
