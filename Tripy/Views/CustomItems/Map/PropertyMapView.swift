//
//  PropertyMapView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 05/01/2024.
//

import Foundation
import SwiftUI
import MapKit


struct PropertyMapView: UIViewRepresentable {

    @StateObject var viewModel = ListingDetailsViewModel()
    @State var model: ListingDetails

    func makeUIView(context: UIViewRepresentableContext<PropertyMapView>) -> MKMapView {

        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<PropertyMapView>) {

        let listingLatitude = viewModel.getLatitude(latitude: model.latitude ?? "0.00000")
        let listingLongitude = viewModel.getLongitude(longitude: model.longitude ?? "-0.00000")

        // set coordinates (lat lon)
//        let coords = CLLocationCoordinate2D(latitude: 53.062640, longitude: -2.968900)
        let coords = CLLocationCoordinate2D(latitude: listingLatitude, longitude: listingLongitude)

        // set span (radius of points)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)

        // set region
        let region = MKCoordinateRegion(center: coords, span: span)

        //set the marker annotation
        let listingAnnotation = MKPointAnnotation()
        listingAnnotation.title = model.name ?? "You are here"
        listingAnnotation.coordinate = CLLocationCoordinate2D(latitude: listingLatitude, longitude: listingLongitude)

        // set the view
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(listingAnnotation)
        uiView.isZoomEnabled = true
        uiView.isScrollEnabled = true

    }
}
