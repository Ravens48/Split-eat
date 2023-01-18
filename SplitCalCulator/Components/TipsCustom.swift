//
//  TipsCustom.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 18/01/2023.
//

import SwiftUI

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
        .font(.system(size: 17, weight: .bold))
        .background(Color("primaryColor"))
        .cornerRadius(12)
    }
}

//struct TipsCustom_Previews: PreviewProvider {
//    static var previews: some View {
//        TipsCustom()
//    }
//}
