//
//  FilterManager.swift
//  Tripy
//
//  Created by Ernest Mwangi on 08/01/2024.
//

import Foundation

protocol FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails]
}

final class FilterManager {
    private var strategy: FilterStrategy

    init(strategy: FilterStrategy) {
        self.strategy = strategy
    }

    func update(strategy: FilterStrategy) {
        self.strategy = strategy
    }

    func applyFilter(to listItems: [ListingDetails], withSpecs specs: [FilterSearchOptions]) -> [ListingDetails] {
        return strategy.filter(listItems: listItems, by: specs)
    }

}


// MARK: - GuestFilter
final class GuestFilter: FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
           let guestNumber = Set(specs.compactMap { (spec) -> Int? in
               if case let .guests(guests) = spec { return guests }; return nil
           })
        return listItems.filter { guestNumber.contains($0.accommodates ?? 0) }
       }
}

// MARK: - BedroomsFilter
final class BedroomsFilter: FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
           let bedrooms = Set(specs.compactMap { (spec) -> Int? in
               if case let .bedrooms(bedrooms) = spec { return bedrooms }; return nil
           })
        return listItems.filter { bedrooms.contains($0.bedrooms ?? 0) }
       }
}

// MARK: - BathsFilter
final class BathsFilter: FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
           let bathrooms = Set(specs.compactMap { (spec) -> Int? in
               if case let .baths(bathrooms) = spec { return bathrooms }; return nil
           })
        return listItems.filter { bathrooms.contains($0.bathrooms ?? 0) }
       }
}

// MARK: - BathsFilter
final class BedsFilter: FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
           let bedNumber = Set(specs.compactMap { (spec) -> Int? in
               if case let .beds(beds) = spec { return beds }; return nil
           })
        return listItems.filter { bedNumber.contains($0.beds ?? 0) }
       }
}


// MARK: - PriceFilter
final class PriceFilter: FilterStrategy {
    func filter(listItems: [ListingDetails], by specs: [FilterSearchOptions]) -> [ListingDetails] {
           let priceSpecs = Set(specs.compactMap { (spec) -> Int? in
               if case let .price(price) = spec { return price }; return nil
           })
        return listItems.filter { priceSpecs.contains($0.price ?? 0) }
       }
}
