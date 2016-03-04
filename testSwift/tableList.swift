//
//  tableList.swift
//  testSwift
//
//  Created by tamik on 16/3/3.
//  Copyright © 2016年 yuxuhong. All rights reserved.
//

import Foundation
import UIKit

class tableList: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var talbelist:UITableView!
    var data:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        data = ["red","green","yellow"]
        talbelist = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        talbelist.dataSource = self
        talbelist.delegate = self
        
        self.view.addSubview(talbelist)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableview")
        
        let text = data[indexPath.row]
        
        if cell==nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableview")
        }
        cell!.textLabel?.text = text
        cell!.textLabel?.textColor = UIColor.blackColor()
        cell!.textLabel?.font = UIFont.systemFontOfSize(14)
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    //}
}