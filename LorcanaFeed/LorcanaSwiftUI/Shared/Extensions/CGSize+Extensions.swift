//
//  CGSize+Extensions.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import SwiftUI

extension CGSize {
    static var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        return window.screen.bounds.size
    }()
}
