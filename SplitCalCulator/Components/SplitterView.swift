//
//  SplitterView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 18/01/2023.
//

import SwiftUI

struct SplitterView:View {
    @ObservedObject var calculatorModel:CalculatorModel
    @State var nbSplit:String = "1"
    var body: some View {
        GeometryReader { gp in
            HStack {
                VStack(alignment:.leading) {
                    Text("Split")
                        .fontWeight(.bold)
                    Text("the total")
                }
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.2)
                VStack {
                    HStack {
                        Button("-", action: {
                            if (Int(nbSplit)! - 1) < 1 {
                                calculatorModel.nbPersonToSplit = 1
                            } else {
                                calculatorModel.nbPersonToSplit = Int(nbSplit)! - 1
                            }
                            nbSplit = String(calculatorModel.nbPersonToSplit)
                            calculatorModel.totalSplittedValue()
                        })
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 35)
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                        .background(Color("primaryColor"))
                        .cornerRadius(12)
                        
                        TextField("$", text: $nbSplit)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 55)
                            .background(.gray.opacity(0.2))
                            .textFieldStyle(PlainTextFieldStyle())
                            .cornerRadius(12)

                        
                        Button("+", action: {
                            calculatorModel.nbPersonToSplit = Int(nbSplit)! + 1
                            nbSplit = String(calculatorModel.nbPersonToSplit)
                            calculatorModel.totalSplittedValue()
                            
                        })
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 35)
                        .padding(15)
                        .font(.system(size: 20, weight: .bold))
                        .background(Color("primaryColor"))
                        .cornerRadius(12)
                    }
                }
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.8)
            }
            .padding(.vertical, 20)
        }
    }
}

//struct SplitterView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplitterView(calculatorModel: <#CalculatorModel#>)
//    }
//}
