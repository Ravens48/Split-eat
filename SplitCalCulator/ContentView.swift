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
        .ignoresSafeArea(.keyboard, edges: .bottom)
//        .padding()
        .environmentObject(calculatorModel)
    }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
