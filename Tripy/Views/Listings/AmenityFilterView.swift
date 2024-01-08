//
//  AmenityFilterView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 06/01/2024.
//

import SwiftUI
import MultiPicker


enum FilterSearchOptions{
    case guests(Int)
    case beds(Int)
    case bedrooms(Int)
    case baths(Int)
    case price(Int)
    case amenities(String)
}

struct CheckListItem: Identifiable, Hashable {
    let id: Int
    var isChecked: Bool
    let itemTitle: String
}

struct AmenityFilterView: View {
    @EnvironmentObject var viewModel : ListingsViewModel
    @Binding var show: Bool
    @State private var guestNum = 0
    @State private var numBeds = 0
    @State private var numBedrooms = 0
    @State private var numBaths = 0
    @State private var selectedNum: Double = 85.0
    @State private var isEditing = false
    @State private var isOn = false

    @State var customFilters = [
        "Internet", "Kitchen", "Cable TV", "Heating", "Essentials", "Washer", "Dryer", "Smoke detector"]

    @State var checkListData = [
        CheckListItem(id: 0, isChecked: false, itemTitle: "Internet"),
        CheckListItem(id: 1,isChecked: false, itemTitle: "Kitchen"),
        CheckListItem(id: 2,isChecked: false, itemTitle:"Cable TV"),
        CheckListItem(id: 3,isChecked: false, itemTitle:"Heating"),
        CheckListItem(id: 4,isChecked: false, itemTitle:"Essentials"),
        CheckListItem(id: 5,isChecked: false, itemTitle:"Washer"),
        CheckListItem(id: 6,isChecked: false, itemTitle:"Dryer"),
        CheckListItem(id: 7,isChecked: false, itemTitle:"Smoke detector")
    ]


    var body: some View {
        VStack(alignment:.leading, spacing: 24, content: {

            HStack(content: {
                Text("Filters")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()

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

            })
            .padding(.horizontal)

            Divider()


            ScrollView(.vertical, showsIndicators: false) {

                // Rooms and Beds

                    VStack(alignment:.leading, spacing: 16, content: {

                        Text("Rooms and Beds")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)

                        Stepper{
                            Text("\(viewModel.numGuests) Guests")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            viewModel.numGuests += 1
                            viewModel.searchOptions.append(.guests(viewModel.numGuests))
                        } onDecrement: {
                            guard viewModel.numGuests > 0 else {return}
                            viewModel.numGuests -= 1
                            viewModel.searchOptions.append(.guests(viewModel.numGuests))
                        }

                        Stepper{
                            Text("\(viewModel.numBedrooms) Bedrooms")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            viewModel.numBedrooms += 1
                            viewModel.searchOptions.append(.bedrooms(viewModel.numBedrooms))

                        } onDecrement: {
                            guard viewModel.numBedrooms > 0 else {return}
                            viewModel.numBedrooms -= 1
                            viewModel.searchOptions.append(.bedrooms(viewModel.numBedrooms))
                        }

                        Stepper{
                            Text("\(viewModel.numBeds) Beds")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            viewModel.numBeds += 1
                        } onDecrement: {
                            guard viewModel.numBeds > 0 else {return}
                            viewModel.numBeds -= 1
                        }

                        Stepper{
                            Text("\(viewModel.numBaths) Bathrooms")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            viewModel.numBaths += 1
                        } onDecrement: {
                            guard viewModel.numBaths > 0 else {return}
                            viewModel.numBaths -= 1
                        }
                    })

                Divider()
                    .padding(.top, 15)
                    .padding(.bottom, 15)

                // Price Range
                VStack(alignment: .leading, spacing: 16, content: {

                    Text("Price Range")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)

                    Text("Select a maximum price")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                        .padding(.top, 10)

                    Slider(value: $selectedNum, in: 10...1000, step: 1.0){
                        Text("Slider")
                    } minimumValueLabel: {
                        Text("$10")
                            .fontWeight(.medium)
                    } maximumValueLabel: {
                        Text("$1000")
                            .fontWeight(.medium)
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }

                    HStack(content: {
                        Text("Max Price: ")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)

                        Text("$\(selectedNum, specifier: "%.f")")
                            .foregroundColor(isEditing ? .accent : .primary)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                    })

                })

                Divider()
                    .padding(.top, 15)
                    .padding(.bottom, 15)

                // Essentials
                VStack(alignment: .leading, spacing: 16, content: {
                    Text("Amenities")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)

                    ForEach(checkListData){ stuff in
                        AmenityCheckListView(listItem: stuff)
                    }

                })

            }
            .padding(.horizontal)

            Spacer()

            VStack{
                Divider()
                    .padding(.top, 5)
                    .padding(.bottom, 10)

                HStack(content: {
                    Button(action: {

                    }, label: {
                        Text("Clear")
                            .foregroundStyle(.accent)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    })

                    Spacer()

                    Button(action: {
                        viewModel.applyOtherFilters()
//                        viewModel.applyNewFilters()
                        show.toggle()

                    }, label: {
                        Text("Apply")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 40)
                            .background(.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }).padding(.horizontal)
            }
            .background(.white)

        })
    }

}



#Preview {
    AmenityFilterView(show: .constant(false))
        .environmentObject(ListingsViewModel())
}
