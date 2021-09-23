//
//  Utils.swift
//  gourment-ios15-swiftui
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import Foundation

class Util {
    static func stringToDate(dt: String) -> Date {
        //format: "20:00 Thu, 23 Sep 2021"
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.date(from: dt) ?? Date()
    }
}
