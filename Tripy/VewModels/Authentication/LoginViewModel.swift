//
//  LoginViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login(){
        guard validate() else{
            return
        }

        //Login
        print("Login Attempt")
        Auth.auth().signIn(withEmail: email, password: password)
    }

  

    func validate() -> Bool {
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Enter Your email"
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address"
            return false
        }

        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please enter your password"
            return false
        }

        return true
    }

}
