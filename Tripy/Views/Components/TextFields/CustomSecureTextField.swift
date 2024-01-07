//
//  CustomSecureTextField.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct CustomSecureTextField: View {
    @Binding var text: String


    var body: some View {
        SecureField("Enter your password", text: $text)
            .frame(width: screenBounds().width - 90, height:45, alignment: .leading)
            .font(.custom("AvenirNext-Medium", size: 16))
            .foregroundStyle(.labelColorPrimary)
            .padding(.leading, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.labelColorSecondary, lineWidth: 1)
                    .opacity(0.3)
                    .frame(height: 40)
            )
    }
}

#Preview {
    CustomSecureTextField(text: .constant(""))
}
