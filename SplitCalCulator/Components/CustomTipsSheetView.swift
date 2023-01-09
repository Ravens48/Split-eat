//
//  CustomTipsSheetView.swift
//  SplitCalCulator
//
//  Created by Thomas ravens on 09/01/2023.
//

import SwiftUI

struct CustomTipsSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var calculatorModel:CalculatorModel
    @State var tips:Float = 0
    
    var body: some View {
        VStack {
            Text("Choose a custom percents for your tips !")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                HStack {
                TextField("", value: $tips, formatter: NumberFormatter())
                    .multilineTextAlignment(.center)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.black)
                    .textFieldStyle(PlainTextFieldStyle())
                Button("% of tips", action: {
                    calculatorModel.percentsOfTips = tips / 100
                    calculatorModel.calculateTipsValue()
                    calculatorModel.totalSplittedValue()
                    dismiss()})
                    .foregroundColor(.white)
                    .padding(15)
                    .background(Color("primaryColor"))
                    .cornerRadius(12)
                    
                }

            Spacer()
            
        }
//        Button("Press to dismiss") {
//            dismiss()
//        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//struct CustomTipsSheetView_Previews: PreviewProvider {
//    @State var calculatorModel = CalculatorModel()
//    static var previews: some View {
//        CustomTipsSheetView(, calculatorModel: calculatorModel)
//    }
//}
