//
//  AmenityFilterView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 06/01/2024.
//

import SwiftUI
import MultiPicker

struct CheckListItem: Hashable {
     var isChecked: Bool = false
     var itemTitle: String
 }

struct AmenityFilterView: View {
    @Binding var show: Bool
    @State private var numGuests = 0
    @State private var numBeds = 0
    @State private var numBedrooms = 0
    @State private var numBaths = 0

    @State private var selectedNum: Double = 85.0
    @State private var isEditing = false
    @State private var isOn = false

    @State var customFilters = [
        "Internet", "Kitchen", "Cable TV", "Heating", "Essentials", "Washer", "Dryer", "Smoke detector"]

    @State var checkListData = [
        CheckListItem(isChecked: false, itemTitle: "Internet"),
        CheckListItem(isChecked: false, itemTitle: "Kitchen"),
        CheckListItem(isChecked: false, itemTitle:"Cable TV"),
        CheckListItem(isChecked: false, itemTitle:"Heating"),
        CheckListItem(isChecked: false, itemTitle:"Essentials"),
        CheckListItem(isChecked: false, itemTitle:"Washer"),
        CheckListItem(isChecked: false, itemTitle:"Dryer"),
        CheckListItem(isChecked: false, itemTitle:"Smoke detector")
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
                            Text("\(numGuests) Guests")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            numGuests += 1
                        } onDecrement: {
                            guard numGuests > 0 else {return}
                            numGuests -= 1
                        }

                        Stepper{
                            Text("\(numBedrooms) Bedrooms")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            numBedrooms += 1
                        } onDecrement: {
                            guard numBedrooms > 0 else {return}
                            numBedrooms -= 1
                        }

                        Stepper{
                            Text("\(numBeds) Beds")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            numBeds += 1
                        } onDecrement: {
                            guard numBeds > 0 else {return}
                            numBeds -= 1
                        }

                        Stepper{
                            Text("\(numBaths) Bathrooms")
                                .foregroundStyle(.primary)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        } onIncrement: {
                            numBaths += 1
                        } onDecrement: {
                            guard numBaths > 0 else {return}
                            numBaths -= 1
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


                        ForEach(customFilters, id:\.self){ filter in
                            Toggle(isOn: $isOn) {
                                Text(filter)
                                    .foregroundStyle(.primary)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            .toggleStyle(CheckBoxToggle())
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
}
