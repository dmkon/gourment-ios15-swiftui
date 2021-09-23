//
//  gourment_ios15_swiftuiTests.swift
//  gourment-ios15-swiftuiTests
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import XCTest
@testable import gourment_ios15_swiftui

class gourment_ios15_swiftuiTests: XCTestCase {

    func getGourmentCollection() -> [GourmentModel] {
            var collection: [GourmentModel] = []
            let item1 = GourmentModel(
                name: "AAA",
                date: Util.stringToDate(dt: "20:00 Thu, 23 Sep 2021")
            )
            collection.append(item1)
            
            let item2 = GourmentModel(
                name: "BBB",
                date: Util.stringToDate(dt: "19:00 Thu, 23 Sep 2021")
            )
            collection.append(item2)
            
            let item3 = GourmentModel(
                name: "CCC",
                date: Util.stringToDate(dt: "18:00 Thu, 23 Sep 2021")
            )
            collection.append(item3)
            
            return collection
        }

        func testSortByAlpha() throws {
            let collection = getGourmentCollection()
            let sut = GourmentViewModel()
            let sortedCollection = sut.getDataByAlpha(collection: collection)
            XCTAssertEqual(sortedCollection.count, 3)
            XCTAssertEqual(sortedCollection[0].gourmentName, "AAA")
            XCTAssertEqual(sortedCollection[1].gourmentName, "BBB")
            XCTAssertEqual(sortedCollection[2].gourmentName, "CCC")
        }

        func testSortByDate() throws {
            let collection = getGourmentCollection()
            let sut = GourmentViewModel()
            let sortedCollection = sut.getDataByDate(collection: collection)
            XCTAssertEqual(sortedCollection.count, 3)
            XCTAssertEqual(sortedCollection[0].gourmentName, "CCC")
            XCTAssertEqual(sortedCollection[1].gourmentName, "BBB")
            XCTAssertEqual(sortedCollection[2].gourmentName, "AAA")
        }
}
