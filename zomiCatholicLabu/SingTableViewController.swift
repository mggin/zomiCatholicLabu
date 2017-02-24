//
//  SingLamTehViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/23/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class SingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var text = tableViewArray()
    
    var control = controlSQLData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.singLamtehZuihNaArrayFilter()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.singLamArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "singViewSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singCell", for: indexPath)
        cell.textLabel?.text = text.singLamArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Verdana", size: 16)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let singNum = text.singLamtehArray[(indexPath?.row)!]
        
        if (segue.identifier == "singViewSegue") {
            let singView = segue.destination as? CrossViewController
            print (singNum)
            singView?.filter = singNum as AnyObject
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
