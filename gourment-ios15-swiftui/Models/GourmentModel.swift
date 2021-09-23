//
//  GourmentModel.swift
//  gourment-ios15-swiftui
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import Foundation
import RealmSwift

class GourmentModel: Object, Identifiable {
    
    var id: UUID = UUID()
    @objc dynamic var date: Date = Date()
    @objc dynamic var gourmentName: String
    
    required init(name: String, date: Date = Date()) {
        self.gourmentName = name
        self.date = date
    }
    
    required init() {
        self.gourmentName = ""
        self.date = Date()
    }
}
