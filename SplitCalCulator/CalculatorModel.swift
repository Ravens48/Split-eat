//
//  CalculatorModel.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 08/01/2023.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    @Published var totalBillsValue:Float = 0
    @Published var nbPersonToSplit:Int = 1
    @Published var totalBillSplitted:Float = 0
    @Published var totalValueTips:Float = 0
    @Published var percentsOfTips:Float = 0
    @Published var totalPerPerson:Float = 0
    
    func roundedValueToString(value:Float) -> String {
        return String(format: "%.2f", value)
    }
    
    func totalSplittedValue() -> Void {
        self.totalPerPerson = (self.totalBillsValue + (self.totalBillsValue * self.percentsOfTips)) / Float(nbPersonToSplit)
    }
    
    func resetAllValue() -> Void {
        self.totalBillsValue = 0
        self.nbPersonToSplit = 1
        self.totalBillSplitted = 0
        self.totalValueTips = 0
        self.percentsOfTips = 0
        self.totalPerPerson = 0
    }
    
//    func choosePercentsTips() ->
}
