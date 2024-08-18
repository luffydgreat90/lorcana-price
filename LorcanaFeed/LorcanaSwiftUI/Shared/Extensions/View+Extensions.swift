//
//  View+Extensions.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import SwiftUI

extension View {

    func makeShadow() -> some View {
        self.shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
            .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
    }

}
