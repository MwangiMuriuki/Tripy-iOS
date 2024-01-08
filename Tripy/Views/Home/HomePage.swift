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
    @StateObject var viewModel = ListingsViewModel()
    @State var listingsData = [ListingDetails]()
    private let dataManager = DataManager()
    @State private var showSearchFiltersPage = false
    @State private var showAmenityFiltersPage = false
    @State var destination = ""
    @State var customFilters = [
        "Internet", "Kitchen", "Cable TV", "Heating", "Essentials", "Washer", "Dryer", "Smoke detector"]

    var body: some View {
        NavigationView{

            if showSearchFiltersPage{
                SearchFiltersPageView(show: $showSearchFiltersPage)
                    .environmentObject(viewModel)
            }
            else if showAmenityFiltersPage{
                AmenityFilterView(show: $showAmenityFiltersPage)
                    .environmentObject(viewModel)

            }
            else{
                VStack{
                    if viewModel.listItems.isEmpty{
                        ProgressView()
                            .progressViewStyle(.circular)
                    }else{

                        // Filters Stack
                        HStack{
                            SearchBarView(location: $viewModel.searchQuery)
                                .onTapGesture {
                                    withAnimation(.snappy){
                                        showSearchFiltersPage.toggle()
                                    }
                                }

                            Spacer()

                            Button(action: {
                                showAmenityFiltersPage.toggle()
                            }, label: {
                                Image(systemName: "slider.horizontal.3")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .padding()
                                    .foregroundStyle(.labelColorPrimary)
                                    .fontWeight(.regular)
                                    .transition(.move(edge: .trailing))
                                    .animation(.default, value: 1)
                                    .clipShape(Circle())
                            })
                            .frame(width: 36, height: 36)
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 0.6)
                                    .foregroundStyle(Color(.systemGray4))
                                    .shadow(color: .black.opacity(0.2),radius: 3)
                            }
                            .padding(.trailing)
                        }

                        List(viewModel.listItems) { item in
                            NavigationLink {
                                ListingDetailView(model: item)
                            } label: {
                                ListingsCardView(model: item)
                                    .padding(.leading, 20)
                            }
                        }
                        .navigationTitle("")
                        .listStyle(.plain)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.fetchAllListings()

        })
        .zIndex(0)
    }
}

#Preview {
    HomePage()
}
