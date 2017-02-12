//
//  ThirdViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/11/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var titleOut: UILabel!
    
    @IBOutlet weak var textKey: UITextView!
    
    @IBOutlet weak var topText: UITextView!
    
    @IBOutlet weak var verse1: UITextView!
    
    @IBOutlet weak var verse2: UITextView!
    
    @IBOutlet weak var verse3: UITextView!
    
    @IBOutlet weak var verse4: UITextView!
    
    @IBOutlet weak var verse5: UITextView!
    
    @IBOutlet weak var verse6: UITextView!
    
    @IBOutlet weak var verse7: UITextView!
    
    @IBOutlet weak var verse8: UITextView!
    
    
    @IBOutlet weak var IntroText: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBAction func btnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        control.dataSet.removeAll()
    }
    
    var filter = Int()
    var control = controlSQLData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textViewList : [UITextView] = [textKey,topText, verse1, verse2, verse3, verse4,
                                           verse5, verse6, verse7, verse8]
        
        let labelList : [UILabel] = [IntroText, label1 , label2, label3, label4,
                                     label5, label6, label7, label8]
        
        control.confData(filter:  self.filter)
        //  For Debugees use: print (control.dataSet.count)
        setTextView(labelList: labelList, textViewlist: textViewList)
        setIntroText(num: self.filter)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setIntroText(num: Int) {
        let Dawng = [96, 139, 179, 190, 248, 250, 303, 377, 468, 476]
        let Siam = [46, 49]
        
        if Dawng.contains(num) {
            IntroText.text = "Dawngtawina:"
        } else if (Siam.contains(num)) {
            IntroText.text = "Simpipa:"
        } else {
            IntroText.text = "     "
        }
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
