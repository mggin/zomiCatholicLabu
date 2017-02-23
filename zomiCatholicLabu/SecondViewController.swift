//
//  SecondViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/11/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit
import GoogleMobileAds

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
    
    @IBOutlet weak var verse15: UITextView!
    
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
    
    @IBOutlet weak var label15: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    // @IBOutlet weak var navTitle: UINavigationBar!
    var filter : AnyObject? = nil
    var control = controlSQLData()
    var mainViewHeihgt = CGFloat(160)
    var text = tableViewArray()
    
    // var barTitle = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = GADRequest()
        request.testDevices = ["DDC9C4A4-D8B5-47DF-8188-C62230EA2B9B", "8e4cb42e8cc98ebf72d9664bacc860e582c36fa8"]
        
        bannerView.adUnitID = "ca-app-pub-3325489361196839/6574558703"
        bannerView.rootViewController = self
        bannerView.load(request)

    
        //self.navigationItem.leftBarButtonItem = leftItem
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: labelPage)
        
        let textViewList : [UITextView] = [labelKey, verse1, verse2, verse3, verse4,
                                           verse5, verse6, verse7, verse8, verse9, verse10,
                                           verse11, verse12, verse13, verse14, verse15]
        
        let labelList : [UILabel] = [label1, label2, label3, label4,
                                     label5, label6, label7, label8, label9, label10,
                                     label11, label12, label13, label14, label15]
        
        control.confData(filter:  self.filter as AnyObject)
        let labelPage = UILabel()
        labelPage.text = String(control.pageNumber)
        // longTitleLabel.font = ................
        labelPage.sizeToFit()
        labelPage.textColor = UIColor.white
        labelPage.textAlignment = NSTextAlignment.left
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: labelPage)
        setTextView(labelList: labelList, textViewlist: textViewList)
        heightConstraint.constant = mainViewHeihgt
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
        for (textView, label) in zip(textViewlist, labelList) {
            // var num = 1
            textView.text = control.dataSet[countText]
            countText += 1
            textView.font = UIFont(name: "Verdana", size : 16)
            label.font = UIFont(name: "Verdana", size : 16)
            setUIViewHeight(textView)
            if (countText > (control.dataSet.count-1) ){
                break
            }
            if (control.pageNumber == 97) {
                labelList[2].isHidden = true
            } else if (control.pageNumber == 335 || control.pageNumber == 336) {
                labelList[0].isHidden = true
                labelList[1].text = "1."
                labelList[2].isHidden = true
                
            } else if (control.pageNumber == 471){
                labelList[4].isHidden = true
            } else {
                print ("")
            }
        }
    }
    func setUIViewHeight(_ txtView : UITextView) {
        txtView.sizeToFit()
        mainViewHeihgt += txtView.frame.height + CGFloat(6)
        // print (mainViewHeihgt)
        
    }
    

    

}
