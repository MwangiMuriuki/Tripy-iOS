//
//  CollapsedFilterView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI

struct CollapsedFilterView: View {
    let title: String
    let description: String

    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)

                Spacer()

                Text(description)

            }
            .font(.caption)
            .fontWeight(.semibold)
        }
       
    }
}

#Preview {
    CollapsedFilterView(title: "", description: "")
}
