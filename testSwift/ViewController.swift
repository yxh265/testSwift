//
//  ViewController.swift
//  testSwift
//
//  Created by tamik on 15/12/9.
//  Copyright © 2015年 yuxuhong. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton(frame: CGRectMake(100,100,200,40))
        button.setTitle("定时器", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.tag = 1
        button.addTarget(self, action: "Jump:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        button = UIButton(frame: CGRectMake(100,150,200,40))
        button.setTitle("tableview列表", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.tag = 2
        button.addTarget(self, action: "Jump:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        button = UIButton(frame: CGRectMake(100,200,200,40))
        button.setTitle("高效率自定义圆角", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.tag = 3
        button.addTarget(self, action: "Jump:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    
    func Jump(sender:AnyObject){
        var controller:UIViewController!
        
        switch sender.tag {
        case 1:
            controller = counter()
        case 2:
            controller = tableList()
        case 3:
            controller = testCorner()
        default:
            controller = counter()
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

