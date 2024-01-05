//
//  SearchBarView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool


    var body: some View {
        HStack{
            TextField("Where to?", text: $searchText)
                .padding(10)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture {
                    isEditing = true
                }

            Button(action: {
                isEditing = false
                searchText = ""
                UIApplication.shared.endEditing()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.accent)
                    .fontWeight(.medium)
                    .padding(.trailing, 8)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: 1)
            })
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), isEditing: .constant(false))
}
