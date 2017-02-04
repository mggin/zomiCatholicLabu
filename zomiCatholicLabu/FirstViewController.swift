//
//  FirstViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var titleOut: UILabel!
    
   /* UITextView initialize here */
    
    @IBOutlet weak var key: UITextView!
    
    @IBOutlet weak var verse1: UITextView!
    
    @IBOutlet weak var chorus: UITextView!
    
    @IBOutlet weak var verse2: UITextView!
    
    @IBOutlet weak var verse3: UITextView!
    
    @IBOutlet weak var verse4: UITextView!
    
    @IBOutlet weak var verse5: UITextView!
    
    @IBOutlet weak var verse6: UITextView!
    
    @IBOutlet weak var verse7: UITextView!
    
    @IBOutlet weak var verse8: UITextView!
    
    @IBOutlet weak var verse9: UITextView!
    
    @IBOutlet weak var verse10: UITextView!
    
    /* UITextView ended */
    
    // UILabel started here 
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var sakkikLabel: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet weak var label10: UILabel!
    
    // UILabel stop here
    
    // var filter = String()
    
    // var control = controlSQLData()
    
    var filter = Int()
    var control = controlSQLData()
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        control.dataSet.removeAll()}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewList : [UITextView] = [key, verse1, chorus, verse2, verse3, verse4,
                                           verse5, verse6, verse7, verse8, verse9, verse10]
        
        let labelList : [UILabel] = [label1, sakkikLabel, label2, label3, label4,
                                     label5, label6, label7, label8, label9, label10]
    
        control.confData(filter:  self.filter)
        print (control.dataSet.count)
        setTextView(labelList: labelList, textViewlist: textViewList)
    
     
       
        }
    
        // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func setTextView(labelList: [UILabel], textViewlist : [UITextView]) {
        
        var countLabelList = labelList.count
        var counttextList = textViewlist.count
        let reverseLabelList = labelList.reversed()
        let reversetextList = textViewlist.reversed()
        for (label, text)in zip(reverseLabelList, reversetextList) {
            label.isHidden = true
            text.isHidden = true
            countLabelList -= 1
            counttextList -= 1
            if (countLabelList < (control.dataSet.count-1) || counttextList < (control.dataSet.count-1)) {
                break
            }
            
            
        }
        let titleLabelLower = control.dataSet[0]
        let titleLabelCap = titleLabelLower.uppercased()
        titleOut.text = titleLabelCap
        var countText = 1
        for textView in textViewlist {
            // var num = 1
            textView.text = control.dataSet[countText]
            countText += 1
            if (countText > (control.dataSet.count-1) ){
                break
            }
        }
    }
    

   

}
