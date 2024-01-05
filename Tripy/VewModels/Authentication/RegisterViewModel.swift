//
//  RegisterViewModel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject{

    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init(){}

    func register(){
        guard validate() else{
            return
        }

        //REGISTER
        print("Registering now")
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.saveUserRecord(uuid: userId)
        }

    }

    private func saveUserRecord(uuid: String){

        let newUser = UserModel(id: uuid, name: fullName, email: email)

        let database = Firestore.firestore()
        database.collection("users")
            .document(uuid)
            .setData(["id" : uuid,
                      "name" : fullName,
                      "email" : email])

    }

    func validate() -> Bool {
        errorMessage = ""

        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Enter Your Full Name"
            print(errorMessage)
            return false
        }

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Enter Your email"
            print(errorMessage)

            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address"
            print(errorMessage)

            return false
        }

        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please enter your password"
            print(errorMessage)

            return false
        }
        guard password.count >= 5 else{
            errorMessage = "Please enter a longer password"
            print(errorMessage)

            return false
        }

        return true
    }

}
