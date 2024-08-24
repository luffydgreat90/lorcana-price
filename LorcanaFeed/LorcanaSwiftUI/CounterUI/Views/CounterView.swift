//
//  CounterView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 23/08/2024.
//

import SwiftUI

public struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()

    public var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            ZStack {
                Text("\(viewModel.lore)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                HStack(content: {
                    Button {
                        viewModel.subtractLore()
                        withAnimation(.spring(response: 2)) {
                            viewModel.finishAnimation()
                        }
                    } label: {
                        Color(.clear)
                    }
                    .frame(width: size.width / 2, height: size.height)

                    Button {
                        viewModel.addLore()
                        withAnimation(.spring(response: 2)) {
                            viewModel.finishAnimation()
                        }
                    } label: {
                        Color(.clear)
                    }
                    .frame(width: size.width / 2, height: size.height)
                }).frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(viewModel.tap.backgroundColor)
            .cornerRadius(10)
        })
    }
}

#Preview {
    CounterView()
}
