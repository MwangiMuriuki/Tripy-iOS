//
//  ListingsViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation

class ListingsViewModel: ObservableObject{
    private let dataManager = DataManager()

    @Published var listItems : [ListingDetails] = []

    func fetchData(){
        dataManager.fetchData { [weak self] fetchedData in
            self?.listItems = fetchedData.results
        }
    }

}
