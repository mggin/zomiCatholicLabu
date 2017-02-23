//
//  ViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    
    // instantiate the controlSQLData class
    var control = controlSQLData()
    
    // instantiate the tableViewArray class
    var text = tableViewArray()

    
    /* notes regular class like controlSQLData class could instantiate using " var control = controlSQLData() but not the class that inherits from UIViewController or which viewDidLoad() method if you want to assign or pass the data use "performSegue and prepareSegue" method (2/6/2017) */

    var indexForSegment = 0   // To indicate the selectedSegmentIndex
    
    @IBOutlet weak var segmentOut: UISegmentedControl!
    
    @IBAction func segmentAct(_ sender: Any) { tableView.reloadData()}
    
    @IBOutlet weak var tableView: UITableView!
    
    // instantiate the UISearchController Class here!
    var searchControl : UISearchController!
    
    var labu = [String]()    // For Debugging use ["Amah muang un", "2 A ut khempeuh te", "3 Hong hehpih thei Topa"]
    var filter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.thungetnaArrayFilter()
        
        confSearchBar()
        
        segmentOut.selectedSegmentIndex = indexForSegment
        // define the selectedSegmentIndex
        text.extractArrayFromMain()
        // extract Array Data from tableViewArray
        self.labu = text.LABU
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of row on section added
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.searchControl.isActive) {
            segmentOut.isEnabled = false
            return filter.count
        }
        segmentOut.isEnabled = true
        switch (segmentOut.selectedSegmentIndex) {
        case 0:
            return labu.count
        case 1:
            return text.LATOMNO.count
        case 2:
            return text.ZONOLNA.count
        case 3:
            return text.THUNGETNA.count
        default:
            return labu.count
        }
        
    }
    
    // cell function added
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        if (self.searchControl.isActive) {
            cell.textLabel?.text = filter[indexPath.row]
            segmentOut.isEnabled = false
        } else {
        segmentOut.isEnabled = true
        switch (segmentOut.selectedSegmentIndex) {
        case 0:
             cell.textLabel?.text = labu[indexPath.row]
            // cell.textLabel?.font = UIFont (name:"Palatino", size:17)
        case 1:
             cell.textLabel?.text = text.LATOMNO[indexPath.row]
            // cell.textLabel?.font = UIFont (name:"Verdana", size:16)
            
        case 2:
            cell.textLabel?.text = text.ZONOLNA[indexPath.row]
            // cell.textLabel?.font = UIFont (name:"Verdana", size:17)
            

        case 3:
            cell.textLabel?.text = text.THUNGETNA[indexPath.row]
            // cell.textLabel?.font = UIFont (name:"Palatino", size:18)

        default:
            cell.textLabel?.text = labu[indexPath.row]
            // cell.textLabel?.font = UIFont (name:"Palatino", size:18)
            }
        }
            cell.textLabel?.font = UIFont (name:"Verdana", size:16)
        return cell
    }
    
    func confSearchBar() {
        self.searchControl = UISearchController(searchResultsController: nil)
        self.searchControl.searchResultsUpdater = self
        self.searchControl.dimsBackgroundDuringPresentation = false
        self.searchControl.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchControl.searchBar
        self.tableView.reloadData()
        searchControl.hidesNavigationBarDuringPresentation = false
        searchControl.searchBar.showsCancelButton = false
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        //
        self.filter.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", self.searchControl.searchBar.text!)
        
        let array = (self.labu as NSArray).filtered(using: searchPredicate)
        self.filter = array as! [String]
        self.tableView.reloadData()
        
    }
    
   //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.searchControl.isActive) {
            var index = Int()
            var str = String()
            let indexPath = self.tableView.indexPathForSelectedRow
            str = filter[(indexPath?.row)!]
            index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            print (str)
            print (index)
            if (text.thirdViewFilterListInt.contains(index)) {
                // print ("Main Third Segue if Search Active")
                performSegue(withIdentifier: "MainThird", sender: self)
                // searchControl.searchBar.isHidden =
            } else if (text.secondViewFilterListInt.contains(index)) {
                // print ("Main Second Segue if Search Active")
                performSegue(withIdentifier: "MainSecond", sender: self )
            } else {
            
                performSegue(withIdentifier: "MainFirst", sender: self)
                
            }
            
        } else if (segmentOut.selectedSegmentIndex == 0 ) {
            var index = Int()
            var str = String()
            let indexPath = self.tableView.indexPathForSelectedRow
            str = labu[(indexPath?.row)!]
            index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            if (text.thirdViewFilterListInt.contains(index)) {
                // print ("Main Third Segue")
                performSegue(withIdentifier: "MainThird", sender: self)
                
            } else if (text.secondViewFilterListInt.contains(index)) {
                // print ("Main Second Segue")
                performSegue(withIdentifier: "MainSecond", sender: self )
            } else {
                // print ("Main First Segue")
                performSegue(withIdentifier: "MainFirst", sender: self)
            }
        
        } else if (segmentOut.selectedSegmentIndex == 1) {
            // print ("Latomno")
            performSegue(withIdentifier: "MainFirst", sender: self)
        }
        else if (segmentOut.selectedSegmentIndex == 2){
            // print ("To ZONOLNA Table View")
            performSegue(withIdentifier: "ToTable", sender: self)
        }
        else if (segmentOut.selectedSegmentIndex == 3){
            // print ("To Thungetna")
            performSegue(withIdentifier: "prayerSegue", sender: self)
        }
            
            else {
        }
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // print ("\(indexPath.row)")
        var selectedOut = String()
        var numOut = Int()
        // _ = segue.identifier
        print ("ill")
        if (self.searchControl.isActive) {
            let indexPath = self.tableView.indexPathForSelectedRow
            selectedOut = filter[(indexPath?.row)!]
            numOut = Int(selectedOut.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            print (numOut)
                if (text.secondViewFilterListInt.contains(numOut)) {
                    let second =  segue.destination as? SecondViewController
                    // print ("Second View Controller")
                    second?.filter = numOut as AnyObject?
                    searchControl.isActive = false
                } else if (text.thirdViewFilterListInt.contains(numOut)){
                    let third =  segue.destination as? ThirdViewController
                    third?.filter = numOut as AnyObject?
                    searchControl.isActive = false
                    // print ("Third View Controller")
                } else {
                    let first =  segue.destination as? FirstViewController
                    // searchControl.isActive = false
                    first?.filter = numOut as AnyObject
                    searchControl.isActive = false
                    // print ("Third View Controller")
            }
        
        } else if (segmentOut.selectedSegmentIndex == 0) {
            let indexPath = self.tableView.indexPathForSelectedRow
            selectedOut = labu[(indexPath?.row)!]
            numOut = Int(selectedOut.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            if (text.thirdViewFilterListInt.contains(numOut)) {
                // print ("Second View Controller")
                let third =  segue.destination as? ThirdViewController
                third?.filter = numOut as AnyObject?
            } else if (text.secondViewFilterListInt.contains(numOut)) {
                let second =  segue.destination as? SecondViewController
                // print ("Third View Controller")
                second?.filter = numOut as AnyObject?
            } else {
                let first =  segue.destination as? FirstViewController
                first?.filter = numOut as AnyObject
                // print ("First View Controller")
            }
    
            
        } else if (segmentOut.selectedSegmentIndex == 1) {
            /// let trimString = String()
            text.latomnoArrayFilter()
            let indexPath = self.tableView.indexPathForSelectedRow
            numOut = text.latomnoArray[(indexPath?.row)!]
            let latomno = segue.destination as? FirstViewController
            
            /*
            let charSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").inverted
            let cleanedString = selectedOut.components(separatedBy: charSet).joined(separator: "")
            print (cleanedString)
            */
        
            latomno?.filter = numOut as AnyObject
            // print (latomno?.filter as? String)
            
        }
        else if (segmentOut.selectedSegmentIndex == 2) {
            // var filter = String()
            let indexPath = self.tableView.indexPathForSelectedRow
            selectedOut = text.ZONOLNA[(indexPath?.row)!]
            let zonolna =  segue.destination as? ZONOLNATableView
            zonolna?.filter = selectedOut.components(separatedBy: CharacterSet.decimalDigits).joined(separator: "")
            zonolna?.index = (indexPath?.row)!
        }
        else if (segmentOut.selectedSegmentIndex == 3) {
            text.latomnoArrayFilter()
            let indexPath = self.tableView.indexPathForSelectedRow
            numOut = text.thungetnaArray[(indexPath?.row)!]
            let thungetna = segue.destination as? PrayerViewController
            // print (numOut)
            thungetna?.filter = numOut as AnyObject?
        }
        else {
            print ("else ")
        }
    
    
    }

}
