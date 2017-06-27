//
//  ViewController.swift
//  TapAndCount
//
//  Created by 王富生 on 2016/11/4.
//  Copyright © 2016年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count:Int = 0
    
    @IBOutlet weak var countDisplay: UILabel!
    
    @IBAction func Tap() {
        if count < 10 {
            count = count + 1
        } else {
            count = 0
        }
        countDisplay.text = String(count)
    }
    
    @IBAction func ResetCount() {
        count = 0
        countDisplay.text = String(count)
    }

}

