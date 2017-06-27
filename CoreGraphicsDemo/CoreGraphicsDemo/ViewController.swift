//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by 王富生 on 2017/1/18.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isGraphViewShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    @IBAction func add(_ sender: AddButtonViewDesign) {
        counterView.counter += 1
        counterLabel.text = String(counterView.counter)
    }
    
    @IBAction func minus(_ sender: MinusButtonViewDesign) {
        counterView.counter -= 1
        counterLabel.text = String(counterView.counter)
    }
    
    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer){
        if isGraphViewShowing {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
}

