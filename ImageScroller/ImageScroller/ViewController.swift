//
//  ViewController.swift
//  ImageScroller
//
//  Created by 王富生 on 2017/1/6.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "001.jpg")
        imageView.sizeToFit()
        
        scrollView.addSubview(imageView)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        
        setZoomScale()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let varticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2:0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2:0
        
        scrollView.contentInset = UIEdgeInsets(top: varticalPadding, left: horizontalPadding, bottom: varticalPadding, right: horizontalPadding)
    }
    


}

