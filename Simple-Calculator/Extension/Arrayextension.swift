//
//  Arrayextension.swift
//  Memorize
//
//  Created by niudan on 2022/12/3.
//

import Foundation

extension Array where Element:Identifiable{
    //return index of certain item
    func findfirstindex(item:Element)->Int?{
        for index in 0..<self.count{
            if item.id==self[index].id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    //if array.count==1,return the first item;else,return nil
    var firstelement:Element?{
        if self.count==1 {
            return self.first
        }
        return nil
    }
    
}

