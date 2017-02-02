//
//  ViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{

    var control = controlSQLData()
    
    // segment outlet added
    @IBOutlet weak var segmentOut: UISegmentedControl!
    // segment action added
    @IBAction func segmentAct(_ sender: Any) { tableView.reloadData()}
    
    // table View added
    @IBOutlet weak var tableView: UITableView!
    
    // UISearchController added
    var searchControl : UISearchController!
    
    // sample list
    let labu = ["Amah muang un", "A ut khempeuh te"]
    let latomno = ["Ngaklah Veng", "Gupna Bukim"]
    let zonolna = ["SUNG TUM NA", "BIAK AP NA"]
    let thungetna = ["Thungetna tuam tuam", "Tonu Maria tung thugetna"]
    var filter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // control.confData(filter: "Amah muang un")
        // control.printData()
        confSearchBar()
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
            return latomno.count
        case 2:
            return zonolna.count
        case 3:
            return thungetna.count
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
        case 1:
             cell.textLabel?.text = latomno[indexPath.row]
        case 2:
            cell.textLabel?.text = zonolna[indexPath.row]

        case 3:
            cell.textLabel?.text = thungetna[indexPath.row]

        default:
            cell.textLabel?.text = labu[indexPath.row]
            }
        }
        
        return cell
    }
    
    func confSearchBar() {
        self.searchControl = UISearchController(searchResultsController: nil)
        self.searchControl.searchResultsUpdater = self
        self.searchControl.dimsBackgroundDuringPresentation = false
        self.searchControl.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchControl.searchBar
        // self.searchControll.searchBar.scopeButtonTitles = ["Small", "Medium", "Large"]
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "first" {
            if let out = segue.destination as? FirstViewController {
                out.filter = labu[(tableView.indexPathForSelectedRow?.row)!]
                print (out.filter)
            }
        }
    }
    

}
