//
//  SecondViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/11/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleOut: UILabel!
    
    /* UITextView start here! */
    @IBOutlet weak var verse1: UITextView!
    
    @IBOutlet weak var verse2: UITextView!
    
    @IBOutlet weak var verse3: UITextView!
    
    @IBOutlet weak var verse4: UITextView!
    
    @IBOutlet weak var verse5: UITextView!
    
    @IBOutlet weak var verse6: UITextView!
    
    @IBOutlet weak var verse7: UITextView!
    
    @IBOutlet weak var verse8: UITextView!
    
    @IBOutlet weak var verse9: UITextView!
    
    @IBOutlet weak var verse10: UITextView!
    
    @IBOutlet weak var verse11: UITextView!
    
    @IBOutlet weak var verse12: UITextView!
    
    @IBOutlet weak var verse13: UITextView!
    
    @IBOutlet weak var verse14: UITextView!
    /* end */
    
    /* label number start */
    
    @IBOutlet weak var labelKey: UITextView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!

    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet weak var label10: UILabel!
    
    @IBOutlet weak var label11: UILabel!
    
    @IBOutlet weak var label12: UILabel!
    
    @IBOutlet weak var label13: UILabel!
    
    @IBOutlet weak var label14: UILabel!
    
    var filter = Int()
    var control = controlSQLData()
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewList : [UITextView] = [labelKey, verse1, verse2, verse3, verse4,
                                           verse5, verse6, verse7, verse8, verse9, verse10,
                                           verse11, verse12, verse13, verse14]
        
        let labelList : [UILabel] = [label1, label2, label3, label4,
                                     label5, label6, label7, label8, label9, label10,
                                     label11, label12, label13, label14]
        
        control.confData(filter:  self.filter)
        setTextView(labelList: labelList, textViewlist: textViewList)

        // Do any additional setup after loading the view.
    }

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
        /* set the Title of Song -- Start Here --- */
        let titleLabelLower = control.dataSet[0]
        let titleLabelCap = titleLabelLower.uppercased()
        titleOut.text = titleLabelCap
        /* -- End Here -- */
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
