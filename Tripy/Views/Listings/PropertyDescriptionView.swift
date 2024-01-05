//
//  PropertyDescriptionView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI

struct PropertyDescriptionView: View {
    @State var model: ListingDetails
    @Environment(\.dismiss) var dismissView

    var body: some View {

        VStack(alignment: .leading, content: {
            ZStack{
                HStack(content: {
                    Button(action: {
                        dismissView()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .tint(.primary)
                    })

                    Spacer()

                })
                .padding(.top)
                .padding(.horizontal)

            }

            GeometryReader(content: { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 20, content: {
                        Text("About this space")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        Text(model.description ?? "Full property description goes here" )
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundStyle(.primary)

                        Text("The space")
                            .font(.custom("AvenirNext-DemiBold", size: 16))
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        Text(model.space ?? "Property space information goes here")
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundStyle(.primary)

                        Text("Neighbourhood Overview")
                            .font(.custom("AvenirNext-DemiBold", size: 16))
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        Text(model.neighborhood_overview ?? "Property space information goes here")
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundStyle(.primary)

                        Text(model.access ?? "Property space information goes here")
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundStyle(.primary)

                        Spacer(minLength: 0)
                    })
                }
                .scrollIndicators(.hidden)
                .padding()
                .frame(width: proxy.frame(in: .global).width)
            })
        })
    }
}

//#Preview {
//    PropertyDescriptionView(propertyDescription: "", model: "")
//}
