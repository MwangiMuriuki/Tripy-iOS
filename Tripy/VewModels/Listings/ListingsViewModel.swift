//
//  ListingsViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation

class ListingsViewModel: ObservableObject{
    private let dataManager = DataManager()
    @Published var listItems = [ListingDetails]()
    @Published var searchQuery = ""
    @Published var listingsCopy = [ListingDetails]()
    @Published var amenitiesQuery: [String] = [""]
    @Published var filterQuery = ""
    @Published var searchOptions = [FilterSearchOptions]()
    @Published var numGuests = 0
    @Published var numBeds = 0
    @Published var numBedrooms = 0
    @Published var numBaths = 0

    func fetchAllListings(){
        dataManager.fetchData { [weak self] fetchedData in
            self?.listItems = fetchedData.results
            self?.listingsCopy = fetchedData.results

            print("FilteredItems: \(self?.listItems.count)")

        }
    }

    func filterForLocation(){
        let filteredListings = listItems.filter({
            $0.neighbourhood_cleansed?.lowercased() == searchQuery.lowercased() ||
            $0.neighbourhood_group_cleansed?.lowercased() == searchQuery.lowercased()
        })

        self.listItems = filteredListings.isEmpty ? listingsCopy : filteredListings
    }


    func applyOtherFilters(){

        let filteredListings = listItems.filter({
            $0.accommodates?.description.lowercased() == numGuests.description ||
            $0.bathrooms?.description.lowercased() == numBaths.description
        })

        self.listItems = filteredListings.isEmpty ? listingsCopy : filteredListings

    }

    func applyNewFilters(){
        let mysearchOptions: [FilterSearchOptions] = [
            .guests(numGuests),
            .baths(numBaths),
            .bedrooms(numBedrooms),
            .beds(numBeds)]


        let guestNumberFilter = GuestNumberFilter(myFilter: BaseFilter())
        let bathroomNumberFilter = BathNumberFilter(myFilter: guestNumberFilter)
        let bedroomNumberFilter = BedroomFilter(myFilter: bathroomNumberFilter)
        let bedNumberFilter = BedNumberFilter(myFilter: bedroomNumberFilter)

        let filteredListings = guestNumberFilter.filter(listItems: listItems, by: mysearchOptions)
        print("NewFilteredItems: \(filteredListings.count)")


        self.listItems = filteredListings.isEmpty ? listingsCopy : filteredListings



    }

    

}
