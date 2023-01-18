//
//  TipsCell.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 18/01/2023.
//

import SwiftUI

struct TipsCell:View {
    @ObservedObject var calculatorModel:CalculatorModel
    var valueTips:Float
    var amountLabel:String
    var body: some View {
        Button(amountLabel, action: {
            calculatorModel.percentsOfTips = valueTips
            calculatorModel.totalValueTips = calculatorModel.totalBillsValue * calculatorModel.percentsOfTips
            calculatorModel.totalSplittedValue()
        })
        .foregroundColor(.white)
        .padding(15)
        .font(.system(size: 16, weight: .bold))
        .background(Color("primaryColor"))
        .cornerRadius(12)
    }
}
