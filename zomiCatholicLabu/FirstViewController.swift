//
//  FirstViewController.swift
//  zomiCatholicLabu
//
//  Created by Thang Gin on 2/1/17.
//  Copyright © 2017 Thang Gin. All rights reserved.
//

import UIKit
import GoogleMobileAds

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
    
    @IBOutlet weak var verse11: UITextView!
    
    @IBOutlet weak var verse12: UITextView!
    
    @IBOutlet weak var verse13: UITextView!
    
    @IBOutlet weak var verse14: UITextView!
    
    // @IBOutlet weak var verse15: UITextView!
    
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
    
    @IBOutlet weak var label11: UILabel!
    
    @IBOutlet weak var label12: UILabel!
    
    @IBOutlet weak var label13: UILabel!
    
    @IBOutlet weak var label14: UILabel!
    

    
    var filter : AnyObject? = nil
    
    var control = controlSQLData()
    
    var mainViewHeight = CGFloat(160)

    @IBOutlet weak var UIView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bannerView: GADBannerView!



    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        
        let request = GADRequest()
        request.testDevices = ["DDC9C4A4-D8B5-47DF-8188-C62230EA2B9B", "8e4cb42e8cc98ebf72d9664bacc860e582c36fa8"]
        
        bannerView.adUnitID = "ca-app-pub-3325489361196839/6574558703"
        bannerView.rootViewController = self
        bannerView.load(request)

    

        // print (verse1.contentSize)
        
        // self.scrollView.contentSize = contentRec.size
        let textViewList : [UITextView] = [key, verse1, chorus, verse2, verse3, verse4,
                                           verse5, verse6, verse7, verse8, verse9, verse10, verse11, verse12, verse13, verse14]
        
        let labelList : [UILabel] = [label1, sakkikLabel, label2, label3, label4,
                                     label5, label6, label7, label8, label9, label10, label11, label12, label13, label14]
    
        control.confData(filter:  self.filter as AnyObject)
        let labelPage = UILabel()
        labelPage.text = String(control.pageNumber)
        // longTitleLabel.font = ................
        labelPage.sizeToFit()
        labelPage.textColor = UIColor.white
        labelPage.textAlignment = NSTextAlignment.left
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: labelPage)
        //  For Debuges use: print (control.dataSet.count)
        setTextView(labelList: labelList, textViewlist: textViewList)
        heightConstraint.constant = mainViewHeight
        // verse1.sizeToFit()
        // print (verse1.contentSize)
    

        }
    
        // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    /* setTextView eliminate the unused Text View and Label and set up the corresponding text to right places */
    
    func setTextView(labelList: [UILabel], textViewlist : [UITextView]) {
        
        var countLabelList = labelList.count
        var counttextList = textViewlist.count
        
        let reverseLabelList = labelList.reversed()
        let reversetextList = textViewlist.reversed()
        
        for (label, text)in zip(reverseLabelList, reversetextList) {
            label.removeFromSuperview()
            text.removeFromSuperview()
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
            textView.font = UIFont(name: "Verdana", size : 16)
            label.font = UIFont(name: "Verdana", size : 16)
            countText += 1
            setUIViewHeight(textView)
            
            if (countText > (control.dataSet.count-1) ){
                break
            }
        }
    }
    
    func setUIViewHeight(_ txtView : UITextView) {
        txtView.sizeToFit()
        mainViewHeight += txtView.frame.height + CGFloat(6)
        // print (mainViewHeihgt)
        
    }
}
