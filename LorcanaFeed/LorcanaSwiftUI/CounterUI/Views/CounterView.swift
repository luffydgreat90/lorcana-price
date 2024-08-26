//
//  CounterView.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 23/08/2024.
//

import SwiftUI

enum ViewBackground {
    case positive, negative, neutral

    var backgroundColor: Color {
        switch self {
        case .positive:
                .green
        case .negative:
                .red
        case .neutral:
                .blue
        }
    }
}

public struct CounterView: View {
    @State private var tap: ViewBackground = .neutral
    @Binding private var lore: Int

    private let isFlip: Bool
    private let subtractHandler: () -> Void
    private let addHandler: () -> Void

    public init(isFlip:Bool = false,
                lore:Binding<Int>,
                subtractHandler:@escaping () -> Void,
                addHandler:@escaping () -> Void) {
        self._lore = lore
        self.isFlip = isFlip
        self.subtractHandler = subtractHandler
        self.addHandler = addHandler
    }

    public var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            ZStack(alignment: .center, content: {
                Text("\(lore)")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                HStack(content: {
                    Button {
                        subtractHandler()
                        tap = .negative
                        withAnimation(.spring(response: 2)) {
                            tap = .neutral
                        }
                    } label: {
                        Color(.clear)
                    }
                    .frame(width: size.width / 2, height: size.height)

                    Button {
                        addHandler()
                        tap = .positive
                        withAnimation(.spring(response: 2)) {
                            tap = .neutral
                        }
                    } label: {
                        Color(.clear)
                    }
                    .frame(width: size.width / 2, height: size.height)
                }).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity)

            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(tap.backgroundColor.gradient)
            .cornerRadius(10)
            .rotationEffect(.degrees(isFlip ? -180 : 0))

        }
    }
}

#Preview {
    @State var number: Int = 4

    return CounterView(isFlip: false, lore:  $number, subtractHandler: {
        number -= 1
    }, addHandler: {
        number += 1
    })
}
