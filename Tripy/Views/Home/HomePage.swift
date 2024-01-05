//
//  HomePage.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct HomePage: View {
    @State var searchText = ""
    @State var isEditing = false
    @State var viewModel = ListingsViewModel()
    @State private var listingsData: [ListingDetails] = []
    private let dataManager = DataManager()

    var body: some View {
//        NavigationView{
//            VStack{
//                SearchBarView(searchText: $searchText, isEditing: $isEditing)
//
//
//                VStack{
//                    if viewModel.listItems.isEmpty{
//                        ProgressView()
//                        .progressViewStyle(.circular)
//                    }
//                    else{
//                        List(viewModel.listItems) { item in
//                            NavigationLink {
//                                ListingDetailView(model: item)
//                            } label: {
//                                ListingsCardView(model: item)
//                                    .padding(.leading, 20)
//                            }
//                        }
//                        .onAppear(perform: {
////                            viewModel.fetchData()
//                            dataManager.fetchData { fetchedData in
//                                listingsData = fetchedData
//                            }
//                        })
//                        .navigationTitle("")
//                        .listStyle(.grouped)
//                    }
//
//                }

//                Spacer(minLength: 0)
//            }
//
//        }

        NavigationView{
            VStack{
                if listingsData.isEmpty{
                    ProgressView()
                        .progressViewStyle(.circular)
                }else{
                    SearchBarView(searchText: $searchText, isEditing: $isEditing)


                    List(listingsData) { item in
                        NavigationLink {
                            ListingDetailView(model: item)
                        } label: {
                            ListingsCardView(model: item)
                                .padding(.leading, 20)
                        }
                    }
                    .navigationTitle("")
                    .listStyle(.grouped)
                }

            }

        }
        .onAppear(perform: {
            dataManager.fetchData { fetchedData in
                listingsData = fetchedData.results
            }
        })
        .zIndex(0)

    }
}

#Preview {
    HomePage()
}
