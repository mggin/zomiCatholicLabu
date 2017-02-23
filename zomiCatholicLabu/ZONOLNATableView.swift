//
//  ZONOLNATableView.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/3/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class ZONOLNATableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var filter = String()
    var index = Int()
    var subIntFormat = [Int]()
    var subStringFormat = [String]()
    
    var text = tableViewArray()

    @IBOutlet weak var tableView: UITableView!
    
    // @IBOutlet weak var navBar: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        text.extractArrayFromZolOlna()
        separateFormat()
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.subZONOLNA[index].count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZonCell", for: indexPath)
        cell.textLabel?.text = subStringFormat[indexPath.row]
        cell.textLabel?.font = UIFont (name:"Verdana", size:16)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // var index = Int()
        // print ("show me error")
    
         /*
        var str = String()
        var strOut = String()
        let indexPath = self.tableView.indexPathForSelectedRow
        str = text.subZONOLNA[index][(indexPath?.row)!]
        strOut = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
        print (str)
         */

        if (text.thirdViewFilterListInt.contains(outInt())) {
            print ("Third View Controller")
            performSegue(withIdentifier: "ZonThird", sender: self)
            
        } else if (text.secondViewFilterListInt.contains(outInt())) {
            print ("Second View Controller")
            performSegue(withIdentifier: "ZonSecond", sender: self )
            
        } else {
            print ("First View Controller")
            // print (text.secondViewListStr)
            performSegue(withIdentifier: "ZonFirst", sender: self)
                    }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // var index = Int()
        
        // index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
        if segue.identifier == "tableToMain" {
            if segue.destination is ViewController {
                // destination.segmentOut.selectedSegmentIndex =
                // destination.indexForSegment = 2
            }
            
        } else if (segue.identifier == "ZonFirst") {
            print ("print seuge")
            let zonFirst = segue.destination as? FirstViewController
            zonFirst?.filter = outInt() as AnyObject
        } else if (segue.identifier == "ZonSecond") {
            let zonSecond = segue.destination as? SecondViewController
            zonSecond?.filter = outInt() as AnyObject
        } else if (segue.identifier == "ZonThird") {
            let zonThird = segue.destination as? ThirdViewController
            zonThird?.filter = outInt() as AnyObject
        } else {
            print ("Error in prpare seuge in ZonolnaTableView")
        }
    }
    
    func outInt() -> Int{
        let indexPath = self.tableView.indexPathForSelectedRow
        let intFormat = subIntFormat[(indexPath?.row)!]
        
        
        return intFormat
    }
    // for
    
    func separateFormat() {
        // let charSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").inverted

        for subString in text.subZONOLNA[index] {
            let cleanedInt = subString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
            subIntFormat.append(Int(cleanedInt)!)
            
            let cleanedString = subString.components(separatedBy: CharacterSet.decimalDigits).joined(separator: "")
            subStringFormat.append(String(cleanedString))
            
        }
        
    }
    
    
    
}
