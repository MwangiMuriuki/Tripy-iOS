//
//  BookingMainScreen.swift
//  Tripy
//
//  Created by Ernest Mwangi on 08/01/2024.
//

import SwiftUI

struct BookingMainScreen: View {
    @State var model: ListingDetails
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numAdults = 0
    @State private var numChildren = 0
    @State private var nightCount = 2


    var body: some View {
        List{
            Section{
                HStack{
                    AsyncImage(url: URL(string: model.photos?[0] ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 100)
                            .cornerRadius(8)

                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 140, height: 100)


                    VStack(alignment: .leading, content: {
                        Text(model.name ?? "Property Name")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                            .lineLimit(2)
                            .padding(.top, 5)

                        Spacer()

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
                        .padding(.bottom, 8)

                    })
                    .frame(height: 100)


                    Spacer()
                }
            }

            Section{
                VStack(alignment: .leading, spacing: 10){
                    Text("Trip details")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)

                    // Dates
                    VStack{

                        VStackLayout(alignment: .leading, spacing: 10){
                            // Location
                            Text("When's your trip?")
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            VStack{
                                DatePicker("From", selection: $startDate, displayedComponents: .date)

                                Divider()

                                DatePicker("To", selection: $endDate, displayedComponents: .date)

                            }
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        }
                    }


                    //Guests
                    VStack(alignment: .leading, spacing: 10){

                            VStack(alignment: .leading, spacing: 10){
                                // Location
                                Text("Who's coming?")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Stepper{
                                    Text("\(numAdults) Adults")
                                        .foregroundStyle(.gray)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                } onIncrement: {
                                    numAdults += 1
                                } onDecrement: {
                                    guard numAdults > 0 else {return}
                                    numAdults -= 1
                                }

                                Stepper{
                                    Text("\(numChildren) Children")
                                        .foregroundStyle(.gray)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                } onIncrement: {
                                    numChildren += 1
                                } onDecrement: {
                                    guard numChildren > 0 else {return}
                                    numChildren -= 1
                                }
                            }

                        }

                }
            }

            Section{
                VStack(alignment: .leading, spacing: 10){
                    Text("Price details")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)

                    // Price Details
                    VStack{

                        VStackLayout(alignment: .leading, spacing: 10){
                            // Location

                            HStack{

                                Text("$")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)

                                +

                                Text(model.price?.description ?? "0")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)
                                +

                                Text(" x \(nightCount) nights")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)

                                Spacer()

                            }
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .fontWeight(.semibold)

                            Divider()
                                .padding(.top, 10)
                                .padding(.bottom, 10)

                            HStack{

                                Text("Total")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)

                                Spacer()

                                Text("$\((model.price ?? 0) * nightCount)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)


                            }
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        }
                    }



                }
            }

            Section{

                VStack(alignment: .center, spacing: 10){

                    VStack{
                        Text("By selecting the button below, you agree to the Host's and Platrom's ")

                        +

                        Text(" House Rules and Terms of Service")
                            .fontWeight(.semibold)
                            .foregroundStyle(.accent)

                    }
                    .font(.caption)
                    .padding(.bottom)


                    Button(action: {

                    }, label: {
                        Text("Confirm and Pay")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 300, height: 40)
                            .background(.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })

                }

            }

        }

    }
}

//#Preview {
//    BookingMainScreen(model: ListingDetails)
//}
