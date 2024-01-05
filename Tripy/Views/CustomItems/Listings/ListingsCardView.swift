//
//  ListingsCardView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI

struct ListingsCardView: View {
    @State var model: ListingDetails
    @State var width = UIScreen.main.bounds.width

    var body: some View {
        VStack{
            //Image Carousel
            ListingsCarousel(photoItems: model.photos!)
                .frame(width: width - 20, height: 200)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8, content: {

                HStack(alignment: .center, content: {
                    Text(model.host_location ?? "Listing")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)

                    Spacer(minLength: 0)

                    Image(systemName: "star.fill")
                        .frame(width:20, height: 20)

                    Text(model.review_scores_rating?.description ?? "0")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    +

                    Text("%")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                })

                Text(model.name ?? "Property Name")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .lineLimit(1)

                Text(model.property_type ?? "Property Type")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)

                Text("$")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)

                +

                Text(model.price?.description ?? "0")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                +

                Text(" night")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
            })

            Spacer(minLength: 0)

        }
    }
}

//#Preview {
//    ListingsCardView(model: <#ListingData#>)
//}
