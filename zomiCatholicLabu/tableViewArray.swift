//
//  tableViewArray.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/2/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import Foundation


class tableViewArray {
    
    var LABU = [String]()
    var LATOMNO = [String]()
    var THUNGETNA = [String]()
    // var ZONONLACASE = [String]()
    var ZONONLA = [String]()
    
    func extractString() {
    
    let textArray = ["LABU", "LATOMNO", "THUNGETNA", "ZONOLNA"]
        for indexArray in textArray {
            let path = Bundle.main.path(forResource: indexArray, ofType: "txt")
            do {
                let content = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                
                switch (indexArray) {
                    case "LABU":
                        LABU = content.components(separatedBy: "|")
                    case "LATOMNO":
                        LATOMNO = content.components(separatedBy: "|")
                    case "THUNGETNA":
                        THUNGETNA = content.components(separatedBy: "|")
                    case "ZONOLNA":
                        ZONONLA = content.components(separatedBy: "|")
                    default:
                        print ("ok")
                    
                    }
                
            } catch { print ("errror") }
        }
    }
 
}
