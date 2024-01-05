//
//  ListingDetailsViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation


class ListingDetailsViewModel: ObservableObject{
    public func getLatitude(latitude: String) -> Double{
        guard let convertedLatitude = NumberFormatter().number(from: latitude)?.doubleValue else { return 0.000000 }

        return convertedLatitude
    }

    public func getLongitude(longitude: String) -> Double{
        guard let convertedLongitude = NumberFormatter().number(from: longitude)?.doubleValue else { return 0.000000 }
        return convertedLongitude
    }

    public func fetchPhotos(){
        
    }
}

