//
//  SetListViewModel.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import LorcanaFeed
import Combine

public final class SetListViewModel: ObservableObject {
    private(set) var sets: [SetViewModel]

    public init(sets: [SetViewModel]) {
        self.sets = sets
    }
}
