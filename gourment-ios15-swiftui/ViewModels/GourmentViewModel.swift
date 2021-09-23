//
//  GourmentViewModel.swift
//  gourment-ios15-swiftui
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import SwiftUI
import RealmSwift

class GourmentViewModel: ObservableObject {
    
    @Published var currentGourmentName = ""
    
    @Published var openNewPage = false
    
    @Published var gourments: [GourmentModel] = []
    
    @Published var sortByAlpha = true
    
    init() {
        fetchData()
    }
    
    func fetchData(sortByAlpha byAlpha: Bool = true) {
        guard let dbRef = try? Realm() else { return }
        
        sortByAlpha = byAlpha
        
        let results = dbRef.objects(GourmentModel.self)
        
        self.gourments = results.compactMap({ (gourment) -> GourmentModel? in
            return gourment
        })
        
        if sortByAlpha {
            gourments = getDataByAlpha(collection: gourments)
        } else {
            gourments = getDataByDate(collection: gourments)
        }
    }
    
    func addData(presentation: Binding<PresentationMode>) {
        guard let dbRef = try? Realm() else { return }
        
        let model = GourmentModel()
        model.gourmentName = currentGourmentName
        
        try? dbRef.write {
            dbRef.add(model)
        }
        fetchData()
        deinitData()
        presentation.wrappedValue.dismiss()
    }
    
    func getDataByAlpha(collection: [GourmentModel]) -> [GourmentModel] {
        collection.sorted {
            $0.gourmentName < $1.gourmentName
        }
    }
    
    func getDataByDate(collection: [GourmentModel]) -> [GourmentModel] {
        collection.sorted {
            $0.date < $1.date
        }
    }
    
    func deinitData() {
        currentGourmentName = ""
    }
}
