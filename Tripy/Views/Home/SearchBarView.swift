//
//  SearchBarView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var location: String
    @State private var showAmenityFiltersPage = false


    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.labelColorPrimary)

                if !location.isEmpty{
                    VStack(alignment: .leading, content: {
                        Text(location)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelColorPrimary)

                        Text("Any Week • Add guests")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    })

                }
                else {
                    VStack(alignment: .leading, content: {
                        Text("Where are you headed?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelColorPrimary)

                        Text("Anywhere • Any Week • Add guests")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    })
                }

                Spacer()

            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 0.6)
                    .foregroundStyle(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.2),radius: 3)
            }
            .padding()
        }

    }
}

#Preview {
    SearchBarView(location: .constant(""))
}
