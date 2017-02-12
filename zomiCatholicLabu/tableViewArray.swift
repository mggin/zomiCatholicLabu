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
    var ZONOLNA = [String]()
    var subZONOLNA = [[String]]()
    
    func extractArrayFromMain() {
    
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
                        ZONOLNA = content.components(separatedBy: "|")
                    default:
                        print ("ok")
                    
                    }
                
            } catch { print ("errror") }
        }
        // print (ZONONLA)
    }
    
    func extractArrayFromZolOlna() {
        // var count : Int = 0
        let zonOlNaTitlesArray = ["SUNG_THUM_NA","BIAK_AP_NA","MISSA_BIAK_NA","SIANGTHO_PUMPI_SAN_NA","LUNG_DAM_KOH_NA","SIANG_THO_PUMPI_BIAKNA","ADVENTU_HUN","LUNG_DAM_BAWL_HUN","ZEHTAN_HUN","THAWHKIK_HUN","KHASIANGTHO_PASIAN","TOTHUM_PASIAN_KHAT","SIANGTHO_LUNGTANG","JESUS_KUMPIPA","PHATNA","HANTHOT_NA_LEH_MUANNA","THUUMNA","BIAKNA_LEH_NGETNA","CHRISTIAN_NUNTAK_NA","HONGPAI_KIK_NANG","HEHNEP_NA","NU_MARIA","SACRAMENTU","MISIANGTHO_TE","JESUS’_PAWLPI","INNTHUPHA_PIAK_NA"]
        
        for indexZonolna in zonOlNaTitlesArray {
            let newPath = Bundle.main.path(forResource: indexZonolna, ofType: "txt")
            do {
                let content = try String(contentsOfFile: newPath!, encoding: String.Encoding.utf8)
                subZONOLNA.append(content.components(separatedBy: "|"))

            } catch { print ("error") }
            
            
        }

    }
    // print (subZONOLNA.count)
 
}
