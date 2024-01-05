//
//  ListingDetailView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListingDetailView: View {
    @StateObject var viewModel = ListingDetailsViewModel()
    @State var model: ListingDetails
    @State var showFullDescription = false
    @State var width = UIScreen.main.bounds.width

    var body: some View {
        VStack(alignment: .leading, content: {
            GeometryReader(content: { proxy in
                ScrollView(.vertical, showsIndicators: false, content: {
                    ZStack{
                        TabView{
                            var photoItems : [String] = model.photos ?? [""]

                            ForEach(photoItems, id: \.self) { item in
                                WebImage(url: URL(string: item))
                                    .onSuccess { image, data, cacheType in

                                    }
                                    .resizable()
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .scaledToFill()
                            }
                        }
                        .frame(width: proxy.frame(in: .global).width , height: 300)
                        .tabViewStyle(PageTabViewStyle())
                    }

                    // MARK: - Property info
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text(model.name ?? "Property Name")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        Text(model.street ?? "Property Street")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(1)


                        HStack(alignment: .center, spacing:3, content: {
                            //Guests
                            Text(model.accommodates?.description ?? 0.description )
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("guests")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("•")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            //Bedrooms
                            Text(model.bedrooms?.description ?? 0.description)
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("bedrooms")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("•")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            // Beds
                            Text(model.beds?.description ?? 0.description)
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("beds")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("•")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            //Bathrooms

                            Text(model.bathrooms?.description ?? 0.description)
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)

                            Text("bathrooms")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        })

                        HStack(alignment: .center, spacing:3, content: {
                            //Rating
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:14, height: 14)

                            Text(model.review_scores_rating?.description ?? "0")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)
                            +

                            Text("%")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)

                            Text("•")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)
                                .lineLimit(1)

                            //Reviews
                            Text(model.number_of_reviews?.description ?? "0")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)
                                .lineLimit(1)

                            Text("reviews")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundStyle(.primary)
                                .lineLimit(1)
                        })

                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing)

                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                    // MARK: - Host info
                    HStack{
                        AsyncImage(url: URL(string: model.host_picture_url ?? "")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                        }

                        VStack(alignment: .leading, spacing: 5,content: {
                            Text("Hosted by \(model.host_name ?? "Host Name")")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)

                            Text("Since \(model.host_since ?? " - ")")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.secondary)
                        })
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)

                    }
                    .padding(.leading)
                    .padding(.trailing)

                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                    // MARK: - Neighbourhood info

                    Text(model.neighborhood_overview ?? "neighborhood_overview")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(.trailing)

                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                    // MARK: - Description
                    VStack(content: {
                        Text(model.summary ?? "Property summary")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(.primary)
                            .lineLimit(6)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Button(action: {
                            self.showFullDescription.toggle()
                        }, label: {
                            HStack(alignment: .center, content: {
                                Text("Show more")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                                    .underline()

                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 10, height: 14)
                                    .foregroundStyle(.black)
                            })

                        })
                        .sheet(isPresented: $showFullDescription, content: {
                            PropertyDescriptionView(model: model)
                                .presentationDetents([.large])
                                .presentationDragIndicator(.hidden)
                                .presentationCornerRadius(20)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)

                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing)

                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                    // MARK: - House - Rules
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("House rules")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        Text(model.house_rules ?? "House rules go here")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing)

                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)


                    // MARK: - Map
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Where you'll be")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        PropertyMapView(model: model)
                            .frame(height: 230)
                            .padding(.leading)
                            .padding(.trailing)

                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing)


                    Divider()
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                    // MARK: - Booking Calendar
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Availability")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(2)

                        PropertyMapView(model: model)
                            .frame(height: 230)
                            .padding(.leading)
                            .padding(.trailing)

                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing)

                })
                .frame(width: proxy.frame(in: .global).width)
            })

        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


