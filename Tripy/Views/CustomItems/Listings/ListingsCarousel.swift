//
//  ListingsCarousel.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListingsCarousel: View {

    @State var photoItems : [String] = []
    @State var width = UIScreen.main.bounds.width

    var body: some View {
        TabView{
            ForEach(photoItems, id: \.self) { item in
                WebImage(url: URL(string: item))
                    .onSuccess { image, data, cacheType in

                    }
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

