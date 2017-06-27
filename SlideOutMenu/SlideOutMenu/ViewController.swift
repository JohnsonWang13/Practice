//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by 王富生 on 2017/1/6.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var open: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
