//
//  LandingPage.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    @State var screenWidth = UIScreen.main.bounds.width - 90
    @StateObject var viewModel = LoginViewModel()
    @State private var showHomePage = false
    @State private var showingErrorAlert = false
    @State var emailPlaceholder = "Enter your email"

    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer(minLength: 0)

                    Image("tripyIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 50)
                        .padding(.trailing)

                    Spacer(minLength: 0)
                }
                .padding(.bottom, 20)

                // Label
                Text("Welcome to Tripy")
                    .font(.custom("AvenirNext-DemiBold", size: 22))
                    .foregroundStyle(.labelColorPrimary)
                    .frame(alignment: .center)
                    .padding(.bottom, 20)

                // MARK: - Login Form
                VStack(alignment: .leading, spacing: 10, content: {
                    // Error Message Label
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(.accent)
                            .frame(width: screenBounds().width - 90, alignment: .leading)
                    }

                    // Email Label
                    Text("Email")
                        .font(.custom("AvenirNext-Medium", size: 16))
                        .foregroundStyle(.labelColorPrimary)
                        .frame(width: screenBounds().width - 90, alignment: .leading)


                    // Email Field
                    CustomAuthTextField(placeHolder: $emailPlaceholder, text: $viewModel.email)

                    // Password Label
                    Text("Password")
                        .font(.custom("AvenirNext-Medium", size: 16))
                        .foregroundStyle(.labelColorPrimary)
                        .frame(width: screenBounds().width - 90, alignment: .leading)

                    // Password Field
                    CustomSecureTextField(text: $viewModel.password)

                    // Forgot Password Button
                    Button(action: {
                        print("Forgot Password")
                    }, label: {
                        Text("Forgot Password?")
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.accentColor)
                            .frame(width: screenBounds().width - 90, alignment: .leading)

                    })
                    .frame(width: screenBounds().width - 90, alignment: .leading)

                    // MARK: - Login Button
                    Button(action: {
                        viewModel.login()
                    }, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: screenBounds().width - 90, height: 48)
                            .foregroundStyle(.accent)
                            .overlay(
                                Text("Login")
                                    .font(.custom("AvenirNext-Bold", size: 16))
                                    .foregroundStyle(Color.white)
                            )
                    })

                })
                .padding(.bottom, 10)

                // MARK: - Separator
                HStack(alignment: .center, spacing: 8, content: {
                    Rectangle()
                        .frame(height: 0.8)
                        .foregroundStyle(.separator)

                    Text("Or")
                        .font(.custom("AvenirNext-Medium", size: 16))
                        .foregroundStyle(.labelColorSecondary)

                    Rectangle()
                        .frame(height: 0.8)
                        .foregroundStyle(.separator)

                })
                .frame(width: 300, height: 10)


                // MARK: - Google Signin
                VStack(alignment: .center, spacing: 30, content: {

                    Button(action: {
                        print("Sign in with Google")

                        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                        // Create Google Sign In configuration object.
                        let config = GIDConfiguration(clientID: clientID)
                        GIDSignIn.sharedInstance.configuration = config

                        // Start the sign in flow!
                        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                          guard error == nil else {
                              return
                          }

                          guard let user = result?.user,
                            let idToken = user.idToken?.tokenString
                          else {
                              return
                          }

                          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                         accessToken: user.accessToken.tokenString)

                            Auth.auth().signIn(with: credential) { result, error in
                                guard error == nil else{
                                    // MANAGE ERROR
                                    viewModel.errorMessage = error?.localizedDescription ?? "Error Signing You in"
                                    return
                                }
                            }
                        }

                    }, label: {
                        HStack(spacing: -4, content: {
                            Image("google_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                                .padding(.trailing)

                            Text("Continue with Google")
                                .font(.custom("AvenirNext-DemiBold", size: 16))
                                .foregroundStyle(.labelColorPrimary)
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.labelColorSecondary, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 300, height: 45)
                        )

                    })

                    VStack(alignment: .leading, content: {
                        HStack(spacing: 2, content: {
                            Text("New around here? ")
                                .font(.custom("AvenirNext-Medium", size: 15))

                            NavigationLink {
                                RegisterView().toolbar(.hidden)
                            } label: {
                                Text("Create Account")
                                    .font(.custom("AvenirNext-Medium", size: 16))
                                    .foregroundStyle(.accent)
                            }

                        })
                    })

                })
                .padding()

            }
            .padding(.top, 30)

            Spacer(minLength: 0)

        }  


    }

}


#Preview {
    LoginView()
}
