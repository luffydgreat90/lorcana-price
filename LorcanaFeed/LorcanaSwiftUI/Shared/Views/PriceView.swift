//
//  PriceView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 18/08/2024.
//

import SwiftUI

struct PriceView: View {
    let header: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.caption)
                
            Text(value)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding(8)
        .foregroundColor(.white)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
        }
    }
}

#Preview {
    PriceView(header: "Price:", value: "$2.00")
}
