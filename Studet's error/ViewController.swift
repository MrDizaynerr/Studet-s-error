//
//  ViewController.swift
//  Studet's error
//
//  Created by Слава Викторов on 22/05/2019.
//  Copyright © 2019 Vyacheslav Viktorov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mea1: UITextField!
    @IBOutlet weak var mea2: UITextField!
    @IBOutlet weak var mea3: UITextField!
    @IBOutlet weak var mea4: UITextField!
    @IBOutlet weak var mea5: UITextField!
    @IBOutlet weak var averageLabel: UILabel!
    
    let emptyAlert = UIAlertController(title: "Внимание!", message: "Заполните все поля верно", preferredStyle: .alert)
    
    var mea1Res:Double!
    var mea2Res:Double!
    var mea3Res:Double!
    var mea4Res:Double!
    var mea5Res:Double!
    
    var meaAvr:Double!
    
    var result:Double!
    
    var meaCount5 = true
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let okButton = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        emptyAlert.addAction(okButton)
        
    }

    @IBAction func changeMea(_ sender: Any) {
        mea4.isHidden = !mea4.isHidden
        mea5.isHidden = !mea5.isHidden
        meaCount5 = !meaCount5
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
    
    @IBAction func clearButton(_ sender: Any) {
        mea1.text = nil
        mea2.text = nil
        mea3.text = nil
        mea4.text = nil
        mea5.text = nil
    }
    @IBAction func solveBut(_ sender: Any) {
        
        if meaCount5 == false && mea1.text?.doubleValue != 0 && mea2.text?.doubleValue != 0 && mea3.text?.doubleValue != 0 {
            
                mea1Res = mea1.text!.doubleValue
                mea2Res = mea2.text!.doubleValue
                mea3Res = mea3.text!.doubleValue
                
                meaAvr = (mea1Res+mea2Res+mea3Res)/3
                
                mea1Res = pow(mea1Res-meaAvr,2)
                mea2Res = pow(mea2Res-meaAvr,2)
                mea3Res = pow(mea3Res-meaAvr,2)
                
                result = 1.3*pow((mea1Res+mea2Res+mea3Res)/6,0.5)
                
                resultLabel.text = String(result)
                averageLabel.text = String(meaAvr)
                
        }else if mea1.text?.doubleValue != 0 && mea2.text?.doubleValue != 0 && mea3.text?.doubleValue != 0 && mea4.text?.doubleValue != 0 && mea5.text?.doubleValue != 0{
                
                mea1Res = mea1.text!.doubleValue
                mea2Res = mea2.text!.doubleValue
                mea3Res = mea3.text!.doubleValue
                mea4Res = mea4.text!.doubleValue
                mea5Res = mea5.text!.doubleValue
                
                meaAvr = mea1Res
                meaAvr = meaAvr+mea2Res
                meaAvr = meaAvr+mea3Res
                meaAvr = meaAvr+mea4Res
                meaAvr = meaAvr+mea5Res
                
                meaAvr = meaAvr/5
                
                mea1Res = pow(mea1Res-meaAvr,2)
                mea2Res = pow(mea2Res-meaAvr,2)
                mea3Res = pow(mea3Res-meaAvr,2)
                mea4Res = pow(mea4Res-meaAvr,2)
                mea5Res = pow(mea5Res-meaAvr,2)
                
                result = mea1Res+mea2Res
                result = result + mea3Res+mea4Res+mea5Res
                
                result = result/20
                result = pow(result,0.5)
                result = 1.2*result
                
                averageLabel.text = String(meaAvr)
                resultLabel.text = String(result)
        }else{
            present(emptyAlert, animated: true, completion: nil)
        }
        
    }
    
}

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
