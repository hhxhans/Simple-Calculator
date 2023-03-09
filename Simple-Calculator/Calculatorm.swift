//
//  Calculatorm.swift
//  Simplecalculator
//
//  Created by niudan on 2022/12/8.
//

import Foundation
import UIKit
import SwiftUI
import MathExpression
//calculate using MathExpression repository
func calculate(string:String)->Double?{
   let expression = try? MathExpression(string)
    return expression?.evaluate()
}
//model of calculator
class calculatormodel:ObservableObject{
    //arrange the place and order of the calculator buttons
    @Published private(set) var calculator=Simplecalculator(buttoninitcontent1: ["7","8","9","+","AC","4","5","6","-","DEL","1","2","3","×","=","0",".","(","÷",")"])
    var buttons:[Simplecalculator.Calculatorbutton]{calculator.buttons}
    func click(buttonclicked:Simplecalculator.Calculatorbutton){calculator.click(buttonclicked:buttonclicked)}
    var display:String?{calculator.display}
}
struct Simplecalculator{
      var buttons:[Calculatorbutton]
    // upper label
    var display:String?
    //actions taken after buttons are clicked
    mutating func click(buttonclicked:Calculatorbutton){
        if buttonclicked.buttoncontent != "" {
            if display != nil {
                switch buttonclicked.buttoncontent.operandtype{
                 case 0,1:display?.append(buttonclicked.buttoncontent)
                 case 2:display=nil
                 case 3:if display?.count != 1{
                    display?.removeLast()}else{
                        display=nil
                    }
                case 4:if let result=calculate(string:display!.replacedexpression){
                    display="\(result)"
                    }else{
                    print("illegal expression")
                    }
                default:if true{}
                   
                }
            }else{
                if (buttonclicked.buttoncontent.operandtype==0)||(buttonclicked.buttoncontent.operandtype==1) {
                    display=buttonclicked.buttoncontent
                }
            }
        }
        }
    
    
      init(buttoninitcontent1:Array<String>) {
          buttons=[Calculatorbutton]()
              for index in 0..<buttoninitcontent1.count {
                  buttons.append(Calculatorbutton(buttoncontent: buttoninitcontent1[index], type: buttoninitcontent1[index].operandtype, id:index))
              }
          display=nil
      }
    struct Calculatorbutton:Identifiable{
            var buttoncontent:String
            var type:Int?
            var id:Int
    }
}




