//
//  ViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    
    // instantiate the controlSQLData class
    var control = controlSQLData()
    
    // instantiate the tableViewArray class
    var text = tableViewArray()
    
    let secondViewList = [5, 9, 16, 19, 20, 22, 30, 31, 33, 34, 35, 39, 40, 41, 42, 43, 44,  45,48, 50, 51, 52,  59, 60, 61, 63, 68, 73, 77, 81, 85, 87, 97, 99, 100, 101, 104, 105, 106, 111, 114, 121, 122, 126, 127, 129, 133, 146, 150, 156,  164, 165, 170, 173, 175, 177, 182, 183, 185, 186, 187, 188, 189, 191, 193, 196, 197, 198, 210,216, 218, 222, 223, 228, 229, 232, 234, 235, 236, 238, 242, 246, 252, 258, 261, 263, 265, 269, 275, 284, 288, 290, 292, 297, 301, 305, 315, 317, 319, 320, 321, 324, 327, 329,332, 334, 337, 338, 341, 343, 344, 345, 346, 361, 367, 370, 373, 391, 395, 401, 404, 410, 416, 420, 444, 450, 453, 454, 463, 467, 471, 472, 479, 484, 486, 491, 495, 496, 499, 509, 510, 511, 520, 521, 528]
    
    let thirdViewList = [46, 49, 96, 139, 179, 190, 248, 250, 303, 377, 468, 476]
    
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
        segmentOut.selectedSegmentIndex = indexForSegment    // define the selectedSegmentIndex
        text.extractArrayFromMain()      // extract Array Data from tableViewArray
        self.labu = text.LABU  // assign values
        confSearchBar()   // configure seacrch bar
        // confSearchBar()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
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
             // cell.textLabel?.font = UIFont (name:"Palatino", size:17)
        case 2:
            cell.textLabel?.text = text.ZONOLNA[indexPath.row]

        case 3:
            cell.textLabel?.text = text.THUNGETNA[indexPath.row]

        default:
            cell.textLabel?.text = labu[indexPath.row]
            cell.textLabel?.font = UIFont (name:"Palatino", size:18)
            }
        }
        cell.textLabel?.font = UIFont (name:"Palatino", size:18)
        return cell
    }
    
    func confSearchBar() {
        self.searchControl = UISearchController(searchResultsController: nil)
        self.searchControl.searchResultsUpdater = self
        self.searchControl.dimsBackgroundDuringPresentation = false
        self.searchControl.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchControl.searchBar
        self.tableView.reloadData()
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
        // print (index)
        print ("did")
        if (self.searchControl.isActive) {
            var index = Int()
            var str = String()
            let indexPath = self.tableView.indexPathForSelectedRow
            str = filter[(indexPath?.row)!]
            index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            print (str)
            print (index)
            if (secondViewList.contains(index)) {
                print ("error")
                performSegue(withIdentifier: "second", sender: self)
                print ("2")
            } else if (thirdViewList.contains(index)) {
                performSegue(withIdentifier: "third", sender: self )
                print ("l")
            } else {
                performSegue(withIdentifier: "first", sender: self)
            }
            
        } else if (segmentOut.selectedSegmentIndex == 0 ) {
            print("done")
            var index = Int()
            var str = String()
            let indexPath = self.tableView.indexPathForSelectedRow
            str = labu[(indexPath?.row)!]
            index = Int(str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            if (secondViewList.contains(index)) {
                print ("print")
                performSegue(withIdentifier: "second", sender: self)
                
            } else if (thirdViewList.contains(index)) {
                performSegue(withIdentifier: "third", sender: self )
                print ("n")
            } else {
                performSegue(withIdentifier: "first", sender: self)
            }
        
        } else if (segmentOut.selectedSegmentIndex == 1){
            print ("")
            performSegue(withIdentifier: "first", sender: self)
        }
            
            else {
        }
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // print ("\(indexPath.row)")
        var selectedOut = String()
        var numOut = Int()
        _ = segue.identifier
        print ("ill")
        if (self.searchControl.isActive) {
            print ("new")
            let indexPath = self.tableView.indexPathForSelectedRow
            selectedOut = filter[(indexPath?.row)!]
            numOut = Int(selectedOut.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            print (numOut)
                if (secondViewList.contains(numOut)) {
                    let second =  segue.destination as? SecondViewController
                    print ("second")
                    second?.filter = numOut
                } else if (thirdViewList.contains(numOut)){
                    let third =  segue.destination as? ThirdViewController
                    third?.filter = numOut
                } else {
                    let first =  segue.destination as? FirstViewController
                    first?.filter = numOut
            }
        
        } else {
            print ("first")
            let indexPath = self.tableView.indexPathForSelectedRow
            selectedOut = labu[(indexPath?.row)!]
            numOut = Int(selectedOut.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            if (secondViewList.contains(numOut)) {
                print ("numOut")
                let second =  segue.destination as? SecondViewController
                second?.filter = numOut
            } else if (thirdViewList.contains(numOut)) {
                let third =  segue.destination as? ThirdViewController
                third?.filter = numOut
            } else {
                let first =  segue.destination as? FirstViewController
                first?.filter = numOut
            }
            
            
        }
    
    }

}
