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
    let experiences_offered: String?
    let photos: [String]?
    let booked_dates: [String]?
    let neighborhood_overview: String?
    let notes: String?
    let transit: String?
    let access: String?
    let house_rules: String?

    let street: String?
    let neighbourhood: String?
    let neighbourhood_cleansed: String?
    let neighbourhood_group_cleansed: String?
    let city: String?
    let state: String?
    let country: String?
    let smart_location: String?
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
    let host_location: String?
    let host_about: String?
    let host_response_time: String?
    let host_thumbnail_url: String?
    let host_picture_url: String?


}
