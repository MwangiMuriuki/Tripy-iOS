//
//  FilterDecorator.swift
//  Tripy
//
//  Created by Ernest Mwangi on 08/01/2024.
//

import Foundation

protocol MyFilter {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails]
}

class BaseFilter: MyFilter{
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        return listItems
    }

}

class FilterDecorator: MyFilter{
    private let myFilter: MyFilter

       init(myFilter: MyFilter) {
           self.myFilter = myFilter
       }
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        return myFilter.filter(listItems: listItems, by: specs)
    }
}


// MARK: - GuestNumberFilter
final class GuestNumberFilter: FilterDecorator {
    override func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        let filter = FilterManager(strategy: GuestFilter())
        let appliedFilterResult = super.filter(listItems: listItems, by: specs)
        let filteredGuests = filter.applyFilter(to: appliedFilterResult, withSpecs: specs)
        return filteredGuests
    }
}

// MARK: - BedroomsFilter
final class BedroomFilter: FilterDecorator {
    override func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        let filter = FilterManager(strategy: BedroomsFilter())
        let appliedFilterResult = super.filter(listItems: listItems, by: specs)
        let filteredBedrooms = filter.applyFilter(to: appliedFilterResult, withSpecs: specs)
        return filteredBedrooms
    }
}

// MARK: - BedNumberFilter
final class BedNumberFilter: FilterDecorator {
    override func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        let filter = FilterManager(strategy: BedsFilter())
        let appliedFilterResult = super.filter(listItems: listItems, by: specs)
        let filteredBeds = filter.applyFilter(to: appliedFilterResult, withSpecs: specs)
        return filteredBeds
    }
}

// MARK: - BathNumberFilter
final class BathNumberFilter: FilterDecorator {
    override func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
        let filter = FilterManager(strategy: BathsFilter())
        let appliedFilterResult = super.filter(listItems: listItems, by: specs)
        let filteredBaths = filter.applyFilter(to: appliedFilterResult, withSpecs: specs)
        return filteredBaths
    }
}
