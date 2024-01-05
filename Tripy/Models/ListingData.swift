//
//  ListingData.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import Foundation

struct ListingData: Codable, Hashable {
    let total_count: Int
    let results: [ListingDetails]
}

struct ListingDetails: Codable, Hashable, Identifiable {
    let id: String?
    let name: String?
    let summary: String?
    let space: String?
    let description: String?
    let photos: [String]?
    let booked_dates: [String]?
    let neighborhood_overview: String?
    let notes: String?
    let transit: String?
    let access: String?
    let house_rules: String?
    let street: String?
    let thumbnail_url: String?
    let medium_url: String?
    let xl_picture_url: String?
    let amenities: [String]?
    let price: Int?
    let review_scores_rating: Int?
    let property_type: String?
    let accommodates: Int?
    let bathrooms: Int?
    let bedrooms: Int?
    let beds: Int?
    let number_of_reviews: Int?
    let latitude: String?
    let longitude: String?

    //Host Details
    let host_id: String?
    let host_name: String?
    let host_since: String?
    let host_thumbnail_url: String?
    let host_picture_url: String?
    let host_location: String?
}
