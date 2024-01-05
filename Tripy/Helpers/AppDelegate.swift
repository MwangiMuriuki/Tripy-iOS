//
//  AppDelegate.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation
import SwiftUI
import FirebaseCore
import GoogleSignIn
import GoogleMaps


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      GMSServices.provideAPIKey("AIzaSyCVjZWjSI5N4O57UCpyolFeJWQnyKVK1_o")


    return true
  }

    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
