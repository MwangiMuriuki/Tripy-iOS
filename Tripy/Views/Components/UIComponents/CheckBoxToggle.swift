//
//  CheckBoxToggle.swift
//  Tripy
//
//  Created by Ernest Mwangi on 06/01/2024.
//

import Foundation
import SwiftUI


struct CheckBoxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {
            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                configuration.label

                Spacer()

                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .frame(width: 24, height: 24)

            }
        })
        .font(.subheadline)
        .foregroundStyle(.primary)
    }


}
