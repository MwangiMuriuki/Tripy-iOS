//
//  Extensions.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }

    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }

        return root
    }
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {  //T is a SwiftGeneric
        // Locate Json File
        guard let url = self.url(forResource: file, withExtension: nil)  else {
            fatalError("Failed to Locate \(file) in bundle")
        }

        // Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to Load \(file) in bundle")
            fatalError("Failed to Load \(file) in bundle")
        }
        // Create a decoder
        let decoder = JSONDecoder()

        // Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            print("Failed to decode \(file) in bundle")
            fatalError("Failed to decode \(file) in bundle")
        }

        // Return ready to use data
        return loaded
    }
}
