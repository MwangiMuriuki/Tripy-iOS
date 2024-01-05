//
//  ContentView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 04/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {

        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
            HomePage()
        }else{
            LoginView()
        }

    }
}

#Preview {
    MainView()
}
