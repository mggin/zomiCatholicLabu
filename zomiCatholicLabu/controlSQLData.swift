//
//  controlSQLData.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import Foundation
import SQLite

class controlSQLData {
    
    // connect to sql database and retrieve data
    
    var dataSet = [String]()
    
    init() {
        // do nothing
    }
    
    func confData(filter: String)  {
        do {
            // finding the sqlite file
            let path = Bundle.main.path(forResource: "dataOfZomiCatholicLabu", ofType: "sqlite")!
            // connect to path
            let db = try Connection(path, readonly : true)
            
            let table = Table("FirstViewTable")
            let title = Expression<String?>("Title")
            let key = Expression<String?>("Key")
            let verse1 = Expression<String?>("Verse1")
            let chorus = Expression<String?>("Chorus")
            let verse2 = Expression<String?>("Verse2")
            let verse3 = Expression<String?>("Verse3")
            let verse4 = Expression<String?>("Verse4")
            let verse5 = Expression<String?>("Verse5")
            let verse6 = Expression<String?>("Verse6")
            
            let expressionList = [title, key, verse1, chorus, verse2, verse3, verse4, verse5, verse6]
            
            /* setting up the expression */
            
            let filterData = table.filter(title == filter)
            
            for entry in try db.prepare(filterData) {
                for expression in expressionList {
                    if (entry[expression] != nil) {
                        // print (entry)
                        dataSet.append(entry[expression]!)
                        
                    }
                }
                
            }
            
        } catch {
            print ("Error")
        }
    }
    
        func printData() {
            print (dataSet.count)
            /*
            for d in dataSet {
                print (d)
            }
 */
        }

    
}
