//
//  controlSQLData.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import Foundation
import SQLite    // SQLite has import external library

class controlSQLData {
    
    // connect to sql database and retrieve data
    
    var dataSet = [String]()
    var pageNumber = Int()
    var toTable : Bool = false
    
    init() {
        // do nothing
    }
    
    func confData(filter: AnyObject)  {
        dataSet.removeAll()
        do {
            // finding the sqlite file
            let path = Bundle.main.path(forResource: "dataOfZomiCatholicLabu", ofType: "sqlite")!
            // connect to path
            let db = try Connection(path, readonly : true)
            
            let table = Table("firstViewTable")
            let title = Expression<String?>("Title")
            let key = Expression<String?>("Key")
            let id = Expression<Int?>("Id")
            let rowid = Expression<Int?>("rowid")
            let verse1 = Expression<String?>("Verse1")
            let chorus = Expression<String?>("Chorus/Verse")
            let verse2 = Expression<String?>("Verse2")
            let verse3 = Expression<String?>("Verse3")
            let verse4 = Expression<String?>("Verse4")
            let verse5 = Expression<String?>("Verse5")
            let verse6 = Expression<String?>("Verse6")
            let verse7 = Expression<String?>("Verse7")
            let verse8 = Expression<String?>("Verse8")
            let verse9 = Expression<String?>("Verse9")
            let verse10 = Expression<String?>("Verse10")
            let verse11 = Expression<String?>("Verse11")
            let verse12 = Expression<String?>("Verse12")
            let verse13 = Expression<String?>("Verse13")
            let verse14 = Expression<String?>("Verse14")

            /* following codes turn SQL commands into Swift codes */

            /* store the list of expression */
            let expressionList = [title, key, verse1, chorus, verse2, verse3, verse4, verse5, verse6, verse7, verse8, verse9, verse10, verse11, verse12, verse13, verse14]
            
            /* setting up the expression */
            if let strFilter = filter as? String {
                print ("string")
            let filterData = table.filter(title == strFilter)
            
            for entry in try db.prepare(filterData) {
                pageNumber = entry[id]!
                for expression in expressionList {
                    if (entry[expression] != nil) {
                        // print (expression)
                        dataSet.append(entry[expression]!)
                        
                    }
                }
                
            }
            
        } else if let intFilter = filter as? Int {
            let filterData = table.filter(rowid == intFilter)
                
                for entry in try db.prepare(filterData) {
                    pageNumber = entry[id]!
                    for expression in expressionList {
                        if (entry[expression] != nil) {
                            // print ("expression")
                            dataSet.append(entry[expression]!)
                        }
                    }
                }
            }
    
        } catch { print ("Error From conSQLData") }
    }
    /* for debugging used
     
     func printData() {
     print (dataSet.count)
     }
     */
    


    /* for debugging used
     
        func printData() {
            print (dataSet.count)

        }
 */
    
    
}
