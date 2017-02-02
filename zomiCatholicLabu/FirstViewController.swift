//
//  FirstViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var filter = "";
    var control = controlSQLData()
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        control.dataSet.removeAll()}
    
    
    // @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleOut: UILabel!
    
    @IBOutlet weak var key: UITextView!
    // @IBOutlet weak var key: UILabel!
    
    @IBOutlet weak var verse1: UITextView!
    
    @IBOutlet weak var chorus: UITextView!
    
    @IBOutlet weak var verse2: UITextView!
    
    @IBOutlet weak var verse3: UITextView!
    
    @IBOutlet weak var verse4: UITextView!
    
    @IBOutlet weak var verse5: UITextView!
    
    // @IBOutlet weak var verse6: UITextView!
    
    @IBOutlet weak var one: UILabel!
    
    @IBOutlet weak var two: UILabel!
    
    @IBOutlet weak var sakkik: UILabel!
    
    @IBOutlet weak var three: UILabel!
    
    @IBOutlet weak var four: UILabel!
    
    @IBOutlet weak var five: UILabel!
    
    // @IBOutlet weak var six: UILabel!
    
    // let uiList = [titleOut, key, verse1, chorus, verse2, verse3, verse4, verse5, verse6]
    
    // var filter = String()
    
    // var control = controlSQLData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewList : [UITextView] = [key, verse1, chorus, verse2, verse3, verse4, verse5]
        // print (filter)
    
        control.confData(filter: self.filter)
        print (control.dataSet.count)
        
      //  var loop = true
        var num = 1
        for textView in textViewList {
            // var num = 1
            textView.text = control.dataSet[num]
            num += 1
            if num > (control.dataSet.count-1) {
                break
            }
        }
     
       
        }
        /*
        var i = 0
        // var j = 1
            for num in 0 ... control.dataSet.count {
                textViewList[i].text = control.dataSet[num]
                if (i <= control.dataSet.count - 1){
                    i += 1
                    
                }
            }*/
        
        /*
        titleOut.text = control.dataSet[0]
        key.text = control.dataSet[1]
        
        verse1.text = control.dataSet[2]
        
        chorus.text = control.dataSet[3]
        verse2.text = control.dataSet[4]
        // verse3.text = control.dataSet[5]
        // verse4.text = control.dataSet[6]
*/

        // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

   

}
