//
//  CalculateTopUp.swift
//  SoftwareTesting_TopUp
//
//  Created by  Harold LIU on 4/28/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import Foundation


public class CalculateTopUp {
    
    let MonthlyRent = 25.00
    let perMinute = 0.15
    
   private func discountPay(minutes:Int,disCountRate:Double) -> Double {
        return Double(minutes)*perMinute*(1-disCountRate) + MonthlyRent
    }
    
   private func normalPay(minutes:Int) -> Double {
        return MonthlyRent + Double(minutes)*perMinute
    }
    
    func calculate(minutes:Int,debtTimes:Int,lastYearDebt:Double) -> Double {
        
        if (minutes > 0 && minutes <= 60)
        {
            if (debtTimes <= 1)
            {
                return discountPay(minutes, disCountRate: 0.01)+lastYearDebt*0.05
            }
            else
            {
                return normalPay(minutes)+lastYearDebt*0.05
            }
        }
        else if(minutes > 60 && minutes <= 120)
        {
            if(debtTimes <= 2)
            {
                return discountPay(minutes, disCountRate: 0.015)+lastYearDebt*0.05
            }
            else
            {
                return normalPay(minutes)+lastYearDebt*0.05
            }
        }
        else if(minutes > 120 && minutes <= 180)
        {
            if(debtTimes <= 3)
            {
                return discountPay(minutes, disCountRate: 0.02)+lastYearDebt*0.05
            }
            else
            {
                return normalPay(minutes)+lastYearDebt*0.05
            }
        }
        else if (minutes > 180 && minutes <= 300)
        {
            if(debtTimes <= 3)
            {
                return discountPay(minutes, disCountRate: 0.025)+lastYearDebt*0.05
            }
            else
            {
                return normalPay(minutes)
            }
        }
        else
        {
            if(debtTimes <= 6)
            {
                return discountPay(minutes, disCountRate: 0.03)+lastYearDebt*0.05
            }
            else
            {
                return normalPay(minutes)+lastYearDebt*0.05
            }
        }
    }
    
}