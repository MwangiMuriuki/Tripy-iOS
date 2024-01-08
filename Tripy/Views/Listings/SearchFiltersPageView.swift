//
//  SearchFiltersPageView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct SearchFiltersPageView: View {
    @Binding var show: Bool
    @EnvironmentObject var viewModel : ListingsViewModel
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var numAdults = 0
    @State private var numChildren = 0


    var body: some View {
        VStack(alignment:.leading, spacing: 24, content: {

            HStack(content: {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                        .frame(width: 32, height: 32)
                })

                Spacer()
            })
            .padding(.bottom, 20)

            //Location
            VStack{
                if selectedOption == .location{
                    VStackLayout(alignment: .leading, spacing: 10){
                        // Location
                        Text("Where are you headed?")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                                .foregroundStyle(.accent)

                            TextField("Search Location", text: $viewModel.searchQuery)
                                .font(.custom("AvenirNext-Medium", size: 16))
                                .foregroundStyle(.labelColorPrimary)
                                .onSubmit {
                                    viewModel.filterForLocation()
                                    show.toggle()
                                }

                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.labelColorSecondary, lineWidth: 1)
                                .opacity(0.3)
                        )

                    }
                }
                else{
                    CollapsedFilterView(title: "Where?", description: "Select Destination")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }

            // Dates
            VStack{
                if selectedOption == .dates{
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
                else{
                    CollapsedFilterView(title: "When?", description: "Select Dates")
                }

            }
            .padding()
            .frame(height: selectedOption == .dates ? 140 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }


            //Guests
            VStack{
                if selectedOption == .guests {
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
                else{
                    CollapsedFilterView(title: "Who?", description: "Add Guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }

            Spacer(minLength: 0)
        })
        .padding(.horizontal)
    }
}

#Preview {
    SearchFiltersPageView(show: .constant(false))
        .environmentObject(ListingsViewModel())
}


