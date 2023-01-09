//
//  TipsView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 08/01/2023.
//

import SwiftUI

struct TipsView: View {
    @ObservedObject var calculatorModel:CalculatorModel

    var body: some View {
        GeometryReader { gp in
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Choose")
                        .fontWeight(.bold)
                    Text("your tips")
                }
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.2)
                VStack {
                    HStack(spacing:35) {
                        TipsCell(calculatorModel: calculatorModel, valueTips: 0.10, amountLabel: "10%" )
                        TipsCell(calculatorModel: calculatorModel, valueTips: 0.20, amountLabel: "20%")
                        TipsCell(calculatorModel: calculatorModel, valueTips: 0.30, amountLabel: "30%")
                    }
                    TipsCustom(calculatorModel: calculatorModel, amountLabel: "Custom tip")
                }
                .frame(minWidth: 0, maxWidth: gp.size.width * 0.8)
            }
            .padding(.vertical, 10.0)
        }
        
    }
}

//struct TipsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipsView()
//            .previewLayout(.fixed(width: 400, height: 200))
//    }
//}
