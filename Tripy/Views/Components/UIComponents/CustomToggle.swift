//
//  CustomToggle.swift
//  Tripy
//
//  Created by Ernest Mwangi on 06/01/2024.
//

import SwiftUI

struct CustomToggle: View {
    @State var isChecked:Bool = false
    var title:String
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        HStack{
            Button(action: toggle) {
                Image(systemName: isChecked ? "checkmark.square" : "square")
            }
            Text(title)
        }
    }
}

#Preview {
    CustomToggle(title: "")
}
