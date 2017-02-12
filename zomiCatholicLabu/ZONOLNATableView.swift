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
    
    var text = tableViewArray()

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBAction func btnBackToMain(_ sender: Any) {

        performSegue(withIdentifier: "backMain", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = filter
        // self.title = filter
        text.extractArrayFromZolOlna()

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "zonCell", for: indexPath)
        cell.textLabel?.text = text.subZONOLNA[index][indexPath.row]
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backMain" {
            if let destination = segue.destination as? ViewController {
                // destination.segmentOut.selectedSegmentIndex =
                destination.indexForSegment = 2
            }
            
        }
    }
}
