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

}
