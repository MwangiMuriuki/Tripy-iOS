//
//  CustomCalendarView.swift
//  Tripy
//
//  Created by Ernest Mwangi on 08/01/2024.
//

import Foundation
import SwiftUI


struct CustomCalendarView: UIViewRepresentable {
    @State var model: ListingDetails

    func makeUIView(context: Context) -> UICalendarView {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "dd/MM/yyyy"

        let calendarView = UICalendarView()
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.locale = Locale(identifier: "en-US")
        calendarView.fontDesign = .rounded
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        let multidayPicker = UICalendarSelectionMultiDate(delegate: context.coordinator)
        calendarView.selectionBehavior = multidayPicker
        multidayPicker.selectedDates = DateDatabase.shared.fetchPreBookedDates(dateArray: model.booked_dates)

        calendarView.delegate = context.coordinator
        return calendarView
    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {

    }

    func makeCoordinator() -> CustomCalendarView.Coordinator {
        return CustomCalendarView.Coordinator(parent1: self)
    }

    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate{
        var parent: CustomCalendarView

        init(parent1: CustomCalendarView) {
            parent = parent1
        }

        func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
            print("Selected Date: ", dateComponents.date as Any)
        }

        func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
            print("De-selected Date: ", dateComponents.date as Any)

        }


        private func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            // Return `true` to allow a date selection; a nil date clears the selection.
            // Require a date selection by returning false if dateComponents is nil.

            return false
        }

        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            // Create and return calendar decorations here.

            guard let day = dateComponents.day else {
                return nil
            }

            return nil
        }


    }

}
