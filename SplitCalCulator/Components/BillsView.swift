//
//  BillsView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 08/01/2023.
//

import SwiftUI

struct BillsView: View {
    @ObservedObject var calculatorModel:CalculatorModel
    var body: some View {
        VStack {
            Text("Total p/person")
                .fontWeight(.bold)
            HStack(alignment: .lastTextBaseline){
                Text("$")
                Text(calculatorModel.roundedValueToString(value: calculatorModel.totalPerPerson))
                    .font(.system(size: 36))
            }
            .fontWeight(.black)
            .padding(10)
            Divider()
            HStack() {
                VStack {
                    Text("Total Bills")
                    HStack {
                        Text("$")
                        Text(calculatorModel.roundedValueToString(value: calculatorModel.totalBillsValue + (calculatorModel.totalBillsValue * calculatorModel.percentsOfTips)))
                    }
                    .foregroundColor(Color("primaryColor"))
                    .fontWeight(.bold)
                }
                Spacer()
                VStack {
                    Text("Total Tips")
                    HStack {
                        Text("$")
                        Text(calculatorModel.roundedValueToString(value: calculatorModel.totalValueTips))
                    }
                    .foregroundColor(Color("primaryColor"))
                    .fontWeight(.bold)

                }
            }.padding(10)
        }
        .padding(20)
        .background(.white)
        .cornerRadius(20)
    }
}

//struct BillsView_Previews: PreviewProvider {
//    static var previews: some View {
////        BillsView(calculatorModel: <#CalculatorModel#>)
//    }
//}
