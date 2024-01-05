//
//  DataManager.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation

final class DataManager{
    init(){}

    var fileManager = FileManager.default


    func fetchData(completion: @escaping (ListingData) -> Void) {
            guard let url = Bundle.main.url(forResource: "tripyListings", withExtension: "json") else {
                print("Error: Failed to find JSON file")
//                completion([])
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: Error fetching data: \(error)")
//                    completion([])
                    return
                }

                guard let jsonData = data else {
                    print("Error: No data found")
//                    completion([])
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(ListingData.self, from: jsonData)
                    completion(decodedData)
                    print("Data Fetched: ", decodedData)
                } catch {
                    print("Error: Error decoding JSON File: ", String(describing: error))
//                    completion([])
                }
            }.resume()
        }


}
