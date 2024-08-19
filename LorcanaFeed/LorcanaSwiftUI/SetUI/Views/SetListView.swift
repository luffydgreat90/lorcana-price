//
//  SetListView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import SwiftUI
import LorcanaFeed

struct SetListView: View {
    @StateObject var viewModel: SetListViewModel

    var body: some View {
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
