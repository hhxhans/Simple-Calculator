//
//  reCalculatorView.swift
//  BeginswiftUI
//
//  Created by niudan on 2023/3/9.
//

import SwiftUI

struct reCalculatorView: View {
    @State var calculator:Simplecalculator=Simplecalculator(buttoninitcontent1: ["7","8","9","+","AC","4","5","6","-","DEL","1","2","3","×","=","0",".","(","÷",")"])
    @State var display:String?=nil
    var body: some View {
        VStack {
            Spacer()
            CalculatorupperlabelView(display: display)
            Calculatorbuttongrid(horizontal: 5, vertical: 4, calculator: $calculator,display: $display)
        }
        
    }
}

struct Calculatorbuttongrid: View {
    var horizontal:Int
    var vertical:Int
    @Binding var calculator:Simplecalculator
    @Binding var display:String?
    var content:[String]{
        var returncontent:[String]=[]
                for index in 0..<calculator.buttons.count {
                    returncontent.append(calculator.buttons[index].buttoncontent)
                }
        return returncontent
    }

    var body: some View {
        if horizontal*vertical >= content.count {
            VStack(spacing:.zero ) {
                ForEach(0..<vertical) { index in
                    HStack(spacing:.zero ) {
                        ForEach(0..<horizontal) { number in
                            ZStack{
                                Button (action:{
                                    let buttonclicked=calculator.buttons[index*horizontal+number].buttoncontent
                                    if buttonclicked != "" {
                                        if display != nil {
                                            switch buttonclicked.operandtype{
                                             case 0,1:display?.append(buttonclicked)
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
                                            if (buttonclicked.operandtype==0)||(buttonclicked.operandtype==1) {
                                                display=buttonclicked
                                            }
                                        }
                                    }
                                })
                                {
                                    if blankbutton(index, number) {
                                        Text("").font(.title) 
                                    }else{
                                        Text(content[index*horizontal+number]).font(.title)
                                    }
                                }
                                buttonbackground()
                            }.frame(height: UIScreen.main.bounds.height*0.4/CGFloat(vertical) )
                                .background(Color("calculatorbutton background color"))
                           
                           
                        }
                    }
                    
                    
                }
                }
            }
        }
    
    
    func blankbutton(_ vindex:Int,_ hindex:Int)->Bool{
        return vindex*horizontal+hindex>=content.count
    }

}
struct buttonbackground:View{
    var body: some View{
        Rectangle() .stroke(Color("calculatorbutton stroke color"))
    }
}


struct reCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        reCalculatorView()
            
    }
}
