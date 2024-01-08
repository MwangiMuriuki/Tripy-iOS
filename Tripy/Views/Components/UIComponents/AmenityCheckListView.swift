//
//  AmenityCheckListView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 07/01/2024.
//

import SwiftUI

struct AmenityCheckListView: View {
//    @EnvironmentObject var viewModel: AmenityFiltersViewModel
    @EnvironmentObject var viewModel: ListingsViewModel
    @State var listItem : CheckListItem


    var body: some View {
        HStack{
//            Text(listItem.itemTitle)
//                .font(.subheadline)
//                .fontWeight(.medium)
//
//            Spacer()

//            Button(action: {
//                viewModel.toggleIsSelected(item: item)
//            }) {
//                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
//                    .frame(width: 26, height: 26)
//            }

            Toggle(isOn: Binding(get: {
                return listItem.isChecked
            }, set: { newValue in
                listItem.isChecked.toggle()
            }), label: {
                Text(listItem.itemTitle)
                    .font(.subheadline)
                    .fontWeight(.medium)
            })
            .toggleStyle(CheckBoxToggle())
            .onChange(of: listItem.isChecked, perform: { state in
                if state{
                    viewModel.amenitiesQuery.append(listItem.itemTitle)
                }
            })


        }
    }
}

#Preview {
    AmenityCheckListView(listItem: CheckListItem(id: 0, isChecked: false, itemTitle: "Title"))
}
