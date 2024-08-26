//
//  SetListView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import SwiftUI
import LorcanaFeed

public struct SetListView: View {
    @StateObject public var viewModel: SetListViewModel

    public init(viewModel: SetListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ScrollView {
            VStack(content: {
                ForEach(viewModel.sets) { set in
                    SetListCell(set: set)
                }
            })
        }
    }
}

#Preview {
    let viewModel = SetListViewModel(sets: [ModelCreator.makeSetModel(id: "1"), ModelCreator.makeSetModel(id: "2")])
    return SetListView(viewModel: viewModel)
}
