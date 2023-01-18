//
//  InputBillsView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 18/01/2023.
//

import SwiftUI

struct InputBillView: View {
    @ObservedObject var calculatorModel:CalculatorModel
    @State var amount = ""
    var body: some View {
        GeometryReader { gp in
            HStack() {
                VStack(alignment: .leading) {
                    Text("Enter")
                        .fontWeight(.bold)
                    Text("you bill")
                }
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.2)
                HStack {
                    Image("dollarCurrency")
                        .resizable()
                        .frame(width: 25, height: 25)
                    TextField("", text: $amount)
                        .onChange(of: amount) { text in
                            if (text.isEmpty) {
                                calculatorModel.resetAllValue()
                            } else {
                                amount = text
                                calculatorModel.totalBillsValue = Float(text) ?? 0.0
                                calculatorModel.totalSplittedValue()
                            }
                            print("passe")
                        }
                        .multilineTextAlignment(.center)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())

                    
                }
                .background(.gray.opacity(0.2))
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0).foregroundColor(Color.black))
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.8)

            }
            .padding(.vertical, 20)
        }
    }
}
