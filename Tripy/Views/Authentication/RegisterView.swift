//
//  RegisterView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewModel()
    @State var namePlaceholder = "Enter Your Full Name"
    @State var emailPlaceholder = "Enter Your Email"


    @Environment(\.dismiss) var dismissView

    var body: some View {
        VStack{
            ZStack{
                HStack(content: {
                    Button(action: {
                        dismissView()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.labelColorPrimary)
                    })

                    Spacer()

                }).padding(.horizontal)

                Image("altIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 65)
                    .padding(.trailing)

            }.padding(.bottom)

            Text("Create your account")
                .font(.custom("AvenirNext-DemiBold", size: 22))
                .foregroundStyle(.labelColorPrimary)
                .frame(width: (screenBounds().width * 0.9), alignment: .center)

            // MARK: - Register Form
            VStack(alignment: .leading, spacing: 10, content: {
                // Name Label
                Text("Full Name")
                    .font(.custom("AvenirNext-Medium", size: 16))
                    .foregroundStyle(.labelColorPrimary)
                    .frame(width: screenBounds().width - 90, alignment: .leading)

                // Name Field
                CustomAuthTextField(placeHolder: $namePlaceholder, text: $viewModel.fullName)

                // Email Label
                Text("Email")
                    .font(.custom("AvenirNext-Medium", size: 16))
                    .foregroundStyle(.labelColorPrimary)
                    .frame(width: screenBounds().width - 90, alignment: .leading)
                    .textCase(.lowercase)

                // Email Field
                CustomAuthTextField(placeHolder: $emailPlaceholder, text: $viewModel.email)

                // Password Label
                Text("Password")
                    .font(.custom("AvenirNext-Medium", size: 16))
                    .foregroundStyle(.labelColorPrimary)
                    .frame(width: screenBounds().width - 90, alignment: .leading)

                // Password Field
                CustomSecureTextField(text: $viewModel.password)

                // Error Message Label
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.custom("AvenirNext-Medium", size: 16))
                        .foregroundStyle(.accent)
                        .frame(width: screenBounds().width - 90, alignment: .leading)
                }

                // Login Button
                Button(action: {
                    viewModel.register()
                }, label: {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: screenBounds().width - 80, height: 48)
                        .foregroundStyle(.accent)
                        .overlay(
                            Text("Create Account")
                                .font(.custom("AvenirNext-Bold", size: 16))
                                .foregroundStyle(Color.white)
                        )

                })
                .padding(.top, 10)

            })
            .padding(.top, 10)
            .padding(.bottom, 10)


            Spacer(minLength: 0)
        }

    }
}

#Preview {
    RegisterView()
}
