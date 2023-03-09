//
//  Stringextension.swift
//  Simplecalculator
//
//  Created by niudan on 2022/12/9.
//

import Foundation

extension String {
    //replace "×","÷" to fit MathExpression
    var replacedexpression:String{
        return self.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/")
    }
    //type of operands
    var operandtype:Int?{
        if (Double(self) != nil) {
            return 0
        }else{
            switch self{
            case ".":return 0
            case "+","-","×","÷","(",")":return 1
            case "AC":return 2
            case "DEL":return 3
            case "=":return 4
            default:return nil
            }
        }
    }
}


