//
//  ViewController.swift
//  SoftwareTesting_TopUp
//
//  Created by  Harold LIU on 4/28/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController,UITextFieldDelegate{


    
    @IBOutlet weak var MinutesInput: UITextField!
    @IBOutlet weak var DebtTimeInput: UITextField!
    @IBOutlet weak var LastYearDebtInput: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var SumbitButton: UIButton!
    
    @IBOutlet weak var DistanceToTop: NSLayoutConstraint!
    @IBOutlet weak var DistanceToFirst: NSLayoutConstraint!
    @IBOutlet weak var DistanceToSecond: NSLayoutConstraint!
    
    let calculator = CalculateTopUp()
    var bound:CGFloat? = 160
    
    var result:Double = 0.0
    {
        didSet{
            ResultLabel.text = "应缴话费： \(result) 元"
            let alert = UIAlertController(title: "确认支付", message: "应缴话费： \(result) 元", preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction(title: "支付宝", style: .Default, handler: { (UIAlertAction) in
                //hud here
               let hud =   MBProgressHUD.showHUDAddedTo(self.view, animated: true)
               hud.mode = .Indeterminate
               hud.labelText = "Pay by AliPay ..."
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), {
                    sleep(1);
                    dispatch_async(dispatch_get_main_queue(), {
                        hud.mode = .CustomView
                        let imageView = UIImage(named: "Checkmark")?.imageWithRenderingMode(.AlwaysTemplate)
                        hud.customView = UIImageView(image:imageView)
                        hud.square = true
                        hud.labelText = "Success"
                        hud.hide(true, afterDelay: 1)
                    })
                
                })
            }))
            alert.addAction(UIAlertAction(title: "银行卡", style: .Default, handler: { (UIAlertAction) in
                //hud here
                let hud =   MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                hud.mode = .Indeterminate
                hud.labelText = "Pay by Credit Card ..."
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), {
                    sleep(1);
                    dispatch_async(dispatch_get_main_queue(), {
                        hud.mode = .CustomView
                        let imageView = UIImage(named: "Checkmark")?.imageWithRenderingMode(.AlwaysTemplate)
                        hud.customView = UIImageView(image:imageView)
                        hud.square = true
                        hud.labelText = "Success"
                        hud.hide(true, afterDelay: 1)
                    })
                    
                })

            }))
            alert.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        MinutesInput.layer.cornerRadius = 5
        DebtTimeInput.layer.cornerRadius = 5
        LastYearDebtInput.layer.cornerRadius = 5
        SumbitButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        DistanceToTop.constant += view.bounds.height
        DistanceToFirst.constant += view.bounds.height
        DistanceToSecond.constant += view.bounds.height
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.5, delay: 0.00, options: .CurveEaseOut, animations: {
            self.DistanceToTop.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.10, options: .CurveEaseOut, animations: {
            self.DistanceToFirst.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: {
            self.DistanceToSecond.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    
    @IBAction func Submit() {
        let bounds = SumbitButton.bounds
        UIView.animateWithDuration(1.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.2,
                                   initialSpringVelocity: 10,
                                   options: .CurveLinear,
                                   animations: { () -> Void in
                                    self.SumbitButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            },
                                   completion: nil)
        SumbitButton.bounds.size.width -= 60
        
        guard let minutes = Int(MinutesInput.text!) where minutes > 0
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        guard let debtTimes = Int(DebtTimeInput.text!) where debtTimes > 0
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        if let lastYearDebt = Double(LastYearDebtInput.text!) {
            result = calculator.calculate(minutes, debtTimes: debtTimes, lastYearDebt: lastYearDebt)
        }
        else
        {
            result = calculator.calculate(minutes,debtTimes: debtTimes,lastYearDebt: 0)
        }
        
       
    }
}

