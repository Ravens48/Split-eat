//
//  ContentView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 07/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculatorModel = CalculatorModel()
    var body: some View {
        VStack(spacing:20) {
            HStack {
                Image("bmoLogo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack {
                    Text("BMO")
                    Text("Calculator")
                }
            }
            BillsView(calculatorModel: calculatorModel)
            InputBillView(calculatorModel: calculatorModel)
            TipsView(calculatorModel: calculatorModel)
            SplitterView(calculatorModel: calculatorModel)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding()
        .environmentObject(calculatorModel)
    }

}



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

struct TipsCustom:View {
    @ObservedObject var calculatorModel:CalculatorModel
    @State private var showingSheet = false
    var amountLabel:String
    var body: some View {
        Button(amountLabel, action:{            showingSheet.toggle()})
        .sheet(isPresented: $showingSheet) {
            CustomTipsSheetView(calculatorModel: calculatorModel)
        }
        .foregroundColor(.white)
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(15)
        .background(Color("primaryColor"))
        .cornerRadius(12)
    }
}

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
        .background(Color("primaryColor"))
        .cornerRadius(12)
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
