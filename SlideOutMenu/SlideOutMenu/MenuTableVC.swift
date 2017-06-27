//
//  MenuTableVC.swift
//  SlideOutMenu
//
//  Created by 王富生 on 2017/1/6.
//  Copyright © 2017年 王富生. All rights reserved.
//

import Foundation

class MenuTableVC: UITableViewController {
    
    var arrayCell = ["One", "Two", "Three"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: arrayCell[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrayCell[indexPath.row]
        
        return cell
    }
}
