//
//  PrayerViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/19/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class PrayerViewController: UIViewController {

    @IBOutlet weak var txtPrayer: UITextView!
    
    @IBOutlet weak var txtPrayer2: UITextView!
    
    var control = controlSQLData()
    
    var mainViewHeight = CGFloat(10)
    
    var filter : AnyObject? = nil
    
    @IBOutlet weak var txtViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        control.confData(filter: self.filter as AnyObject)
        
        let txtViewList : [UITextView] = [txtPrayer, txtPrayer2]
        
        setTextView(txtList: txtViewList)
        
        txtViewHeight.constant = mainViewHeight
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTextView(txtList : [UITextView]) {
        var index = 1
        for txtView in txtList {
            txtView.text = control.dataSet[index]
            index += 1
            setUIViewHeight(txtView)
            
        }
    }
    
    func setUIViewHeight(_ txtView : UITextView) {
        txtView.sizeToFit()
        mainViewHeight += txtView.frame.height 
            // print (mainViewHeihgt)
            
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


