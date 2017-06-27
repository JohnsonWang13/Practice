//
//  Two.swift
//  SlideOutMenu
//
//  Created by 王富生 on 2017/1/9.
//  Copyright © 2017年 王富生. All rights reserved.
//

import Foundation
class Two: UIViewController {
    @IBOutlet weak var open: UIButton!
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
