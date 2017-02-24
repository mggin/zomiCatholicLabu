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
    var latomnoArray = [Int]()
    var thungetnaArray = [Int]()
    var singLamtehArray = [Int]()
    // var ThirdNameFilter = [String]()
    // var secondViewListStr = [String]()
    let secondViewFilterListInt = [5, 9, 16, 19, 20, 22, 30, 31, 33, 34, 35, 39, 40, 41, 42, 43, 44,  45,48, 50, 51, 52,  59, 60, 61, 63, 68, 73, 77, 81, 85, 87, 97, 99, 100, 101, 104, 105, 114, 121, 122, 126, 127, 129, 133, 146, 150, 156,  164, 165, 170, 173, 175, 177, 182, 183, 185, 186, 187, 188, 189, 191, 193, 196, 197, 198, 210,216, 218, 222, 223, 228, 229, 232, 234, 235, 236, 238, 242, 246, 252, 258, 261, 263, 265, 269, 275, 284, 288, 290, 292, 297, 301, 305, 315, 317, 319, 320, 321, 324, 327, 329,332, 334, 335, 336, 337, 338, 341, 343, 344, 345, 346, 361, 367, 370, 373, 391, 395, 401, 404, 410, 416, 420, 444, 450, 453, 454, 463, 467, 471, 472, 479, 484, 486, 491, 495, 496, 499, 509, 510, 511, 520, 521, 528]
    
    let thirdViewFilterListInt = [46, 49, 95, 96, 111, 139, 179, 190, 248, 250, 303, 377, 468, 476]
    
    let DawngInt = [95,96, 139, 111, 179, 190, 248, 250, 303, 377, 468, 476]
    
    let SiamInt = [46, 49]
    
    let singLamArray = ["Singlamteh Lamzuihna", "1. Kipat na Mun", "2. A Nih na Mun", "3. A Thum na Mun", "4. A Li na Mun", "5. A Nga na Mun", "6. A Guk na Mun", "7. A Sagih na Mun", "8. A Giat na Mun", "9. A Kua na Mun", "10. A Sawm na Mun", "11. Sawm leh Khat na Mun", "12. Sawm leh Nih na Mun", "13. Sawm leh Thum na Mun", "14. Sawm leh Li na Mun"]
    
    /*   used to used string as a index
    
    let thirdViewListStr = ["Upna thu kiciamna (Credo)", "Upna thuthuk", "Topa lungdam ko ni", "Topa tungah lungdam un", "Kisikkikna", "Hehpihna le lainatna Pasian", "Pascha Tuuno, Christu", "Lam nong lah ciang", "Siangtho Pasian’ Tunno", "Topa pahtawi un", "Mi khempueh aw phat un", "Leitung gam khempeuh ah", "May kha Tonu", "Nu Maria tung kiciam ni"]
    
    let DawngStr = ["Topa lungdam ko ni", "Topa tungah lungdam un", "Hehpihna le lainatna Pasian", "Kisikkikna", "Pascha Tuuno, Christu", "Lam nong lah ciang", "Siangtho Pasian’ Tunno", "Topa pahtawi un", "Mi khempueh aw phat un", "Leitung gam khempeuh ah", "May kha Tonu", "Nu Maria tung kiciam ni"]
    
    let SiamStr = ["Upna thu kiciamna (Credo)", "Upna thuthuk"]
     
    */
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
                
            } catch { print ("Error From extractArrayFromMain() method") }
        }
       
    }
    
    func extractArrayFromZolOlna() {
        // var count : Int = 0
        let zonOlNaTitlesArray = ["SUNG_THUM_NA","BIAK_AP_NA","MISSA_BIAK_NA","SIANGTHO_PUMPI_SAN_NA","LUNG_DAM_KOH_NA","SIANG_THO_PUMPI_BIAKNA","ADVENTU_HUN","LUNG_DAM_BAWL_HUN","ZEHTAN_HUN","THAWHKIK_HUN","KHASIANGTHO_PASIAN","TOTHUM_PASIAN_KHAT","SIANGTHO_LUNGTANG","JESUS_KUMPIPA","PHATNA","HANTHOT_NA_LEH_MUANNA","THUUMNA","BIAKNA_LEH_NGETNA","CHRISTIAN_NUNTAK_NA","HONGPAI_KIK_NANG","HEHNEP_NA","NU_MARIA","SACRAMENTU","MISIANGTHO_TE","JESUS’_PAWLPI","INNTHUPHA_PIAK_NA"]
        
        for indexZonolna in zonOlNaTitlesArray {
            let newPath = Bundle.main.path(forResource: indexZonolna, ofType: "txt")
            do {
    
                let content = try String(contentsOfFile: newPath!, encoding: String.Encoding.utf8)
                subZONOLNA.append(content.components(separatedBy: "|"))
                

            } catch { print ("Error from extractArrayFromZolOlna() method") }
            
            
        }

    }
    
    func latomnoArrayFilter() {
        for indexFilter in 529 ... 587 {
            latomnoArray.append(indexFilter)
            // print (latomnoArray.count)
            // print (indexFilter)
        }
       
    }
    
    func thungetnaArrayFilter() {
        for thuNum in 588 ... 597 {
            thungetnaArray.append(thuNum)
        }
    }
    
    func singLamtehZuihNaArrayFilter() {
        for singNum in 598 ... 612 {
            singLamtehArray.append(singNum)
        }
    }
    /* since I remove the string as a index, I don't need string filter 
 
    func extracFilterArray() {
        let newPath = Bundle.main.path(forResource: "SecondNameFilter", ofType: "txt")
        do {
            let content = try String(contentsOfFile: newPath!, encoding: String.Encoding.utf8)
            secondViewListStr = content.components(separatedBy: "|")
            
        } catch { print ("error from extratFilterArra") }
    
        
    }
    */
    
    
}
