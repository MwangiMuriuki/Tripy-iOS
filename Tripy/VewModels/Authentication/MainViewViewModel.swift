//
//  MainViewViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }

        }
    }

    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
