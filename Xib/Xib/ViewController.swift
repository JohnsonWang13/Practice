//
//  ViewController.swift
//  Xib
//
//  Created by 王富生 on 2017/3/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let cellContext = ["麵", "非麵"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        let firstCell = UINib(nibName: "FirstCell", bundle: nil)
        let secondCell = UINib(nibName: "SecondCell", bundle: nil)
        let thirdCell = UINib(nibName: "ThirdCell", bundle: nil)
        
        myCollectionView.register(firstCell, forCellWithReuseIdentifier: "firstCellIdentifier")
        myCollectionView.register(secondCell, forCellWithReuseIdentifier: "secondCellIdentifier")
        myCollectionView.register(thirdCell, forCellWithReuseIdentifier: "thirdCellIdentifier")
        
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCellIdentifier", for: indexPath) as! FirstCell
            
            return cell
        } else if indexPath.row == 3{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCellIdentifier", for: indexPath) as! ThirdCell
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCellIdentifier", for: indexPath) as! SecondCell
            
            cell.secondCellLabel.text = cellContext[indexPath.row - 1]
            
            
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return CGSize(width: myCollectionView.frame.width, height: 300)
        }else if indexPath.row == 3 {
            return CGSize(width: myCollectionView.frame.width, height: 100)
        } else {
            return CGSize(width: myCollectionView.frame.width, height: 50)
        }
        
    }
}

