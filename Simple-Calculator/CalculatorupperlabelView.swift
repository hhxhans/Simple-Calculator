//
//  CalculatorupperlabelView.swift
//  BeginswiftUI
//
//  Created by niudan on 2023/3/9.
//

import SwiftUI

struct CalculatorupperlabelView: View {
    var display:String?
    var body: some View {
        if display != nil{
            if let result=calculate(string: display!.replacedexpression) {
               UppertemporalresultView(result: result)
            }
            Text(display!)
                    .font(.largeTitle)
                    .frame( maxWidth: .infinity,  alignment: .bottomTrailing)
          
        }else{
            Text("").font(.largeTitle)
        }
    }
    struct UppertemporalresultView: View {
        var result:Double
        var body: some View {
            if Double(Int(result))  == result  {
                Text("\(Int(result))") .font(.title)
                    .frame( maxWidth: .infinity,  alignment: .bottomTrailing)
            }else{
                Text("\(String(format: "%.3f", result))")
                        .font(.title)
                        .frame( maxWidth: .infinity,  alignment: .bottomTrailing)
            }
        }
        
    }
}

//struct CalculatorupperlabelView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorupperlabelView()
//    }
//}
