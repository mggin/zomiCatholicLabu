//
//  CrossViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/23/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit

class CrossViewController: UIViewController {
    
    @IBOutlet weak var headTitle: UITextView!
    
    @IBOutlet weak var subTitle: UITextView!
    
    @IBOutlet weak var singTextView: UITextView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var control = controlSQLData()
    
    var filter : AnyObject? = nil
    
    var mainViewHeight = CGFloat(150)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        control.confData(filter: filter!)
        // Do any additional setup after loading the view.
        
        let textViewList : [UITextView] = [subTitle,singTextView]
        
        setTextView(txtList: textViewList)
        
        
        heightConstraint.constant = mainViewHeight
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTextView(txtList : [UITextView]) {
        let titleLabelLower = control.dataSet[0]
        let titleLabelCap = titleLabelLower.uppercased()
        headTitle.text = titleLabelCap
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
        
        print (mainViewHeight)
        
    }
}
