//
//  SetListCell.swift
//  LorcanaSwiftUI
//
//  Created by marlon von ansale on 19/08/2024.
//

import SwiftUI
import LorcanaFeed

struct SetListCell: View {
    var set: SetViewModel

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(set.name)
                    .font(.largeTitle)
                HStack{
                    Text(set.released)
                        .font(.caption)
                    Spacer()
                    Text(set.code)
                        .font(.caption)
                        .fontWeight(.bold)
                }.foregroundColor(.gray)
            }
            .padding(16)
            .background(.white)
            .cornerRadius(16.0)
            .makeShadow()
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .frame( minWidth: 0, maxWidth: .infinity)

    }
}

#Preview {
    SetListCell(set: ModelCreator.makeSetModel(id: "1"))
}
