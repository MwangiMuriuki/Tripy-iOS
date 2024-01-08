//
//  DateDatabase.swift
//  Tripy
//
//  Created by Ernest Mwangi on 08/01/2024.
//

import UIKit

class DateDatabase{
    public static let shared: DateDatabase = DateDatabase()

    private init(){}

    func fetchPreBookedDates(dateArray: [String]) -> [DateComponents]{

        var selectedDates: [DateComponents] = []
        for newDate in dateArray {
//            convertToDate(dateString: newDate)

            let dateObject = convertToDate(dateString: newDate)
            let dateComp = Calendar.current.dateComponents([.day, .month, .year], from: dateObject)
            selectedDates.append(dateComp)

        }


//        for date in model.booked_dates ?? [""]{
//            let dateObject = dateFormatter.date(from: date)
//            let dateComp = Calendar.current.dateComponents([.day, .month, .year], from: dateObject ?? Date())
//
//            self.dateObjects.append(dateObject ?? Date())
//            self.preselectedDates.append(dateComp)
//        }


//
//        let selectedDates: [DateComponents] = {
//            var dates: [DateComponents] = []
//            dates.append(date)
//
//            return dates
//        }()

        return selectedDates
    }

    func convertToDate(dateString: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let formattedDate = dateFormatter.date(from: dateString) ?? Date.now
        return formattedDate
    }

}
