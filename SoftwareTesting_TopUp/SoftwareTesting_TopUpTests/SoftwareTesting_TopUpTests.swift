//
//  SoftwareTesting_TopUpTests.swift
//  SoftwareTesting_TopUpTests
//
//  Created by  Harold LIU on 4/28/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import XCTest
import SwiftCSV
@testable import SoftwareTesting_TopUp

class SoftwareTesting_TopUpTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
            
        do {
            let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("testCases", ofType: "csv")!)
            let csv = try CSV(url: url)
            let rows = csv.rows
            let headers = csv.header
            for (index,row) in rows.enumerate() {
                let minute = row["minute"]
                let notOnTime = row["notOnTime"]
                let debt = row["debt"]
                let totalPay = row["totalPay"]
                print(row)
                
                let testCalculate = CalculateTopUp()
                let result = testCalculate.calculate(self.stringToInt(minute)!, debtTimes: self.stringToInt(notOnTime)!, lastYearDebt: self.stringToDouble(debt)!)
                XCTAssertEqualWithAccuracy(result, self.stringToDouble(totalPay)!, accuracy: 0.01, "\(index)Liu: \(result)")
            }
        } catch {
            print(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func stringToInt(string: String?) -> Int? {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        if string != nil {
            return formatter.numberFromString(string!)?.integerValue
        }
        return nil
    }
    
    func stringToDouble(string: String?) -> Double? {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        if string != nil {
            return formatter.numberFromString(string!)?.doubleValue
        }
        return nil
    }
    
}
