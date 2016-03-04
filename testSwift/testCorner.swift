//
//  testCorner.swift
//  testSwift
//
//  Created by tamik on 16/3/3.
//  Copyright © 2016年 yuxuhong. All rights reserved.
//

import Foundation
import UIKit

//扩展给uiview， uiimageview等画圆角。
//这种方法，解决使用
//
extension UIView{
    
    func kt_addCorner(radius radius:CGFloat){
        self.kt_addCorner(radius:radius, borderWidth:1, backgroundColor:UIColor.redColor(), borderColor:UIColor.blackColor())
    }
    func kt_addCorner(radius radius:CGFloat, borderWidth:CGFloat, backgroundColor:UIColor,borderColor:UIColor){
        let imageView = UIImageView(image:kt_drawRectWithRoundedCorner(radius: radius,
            borderWidth: borderWidth,
            backgroundColor: backgroundColor,
            borderColor: borderColor))
        self.insertSubview(imageView, atIndex: 0)
    }
    func kt_drawRectWithRoundedCorner(radius radius:CGFloat, borderWidth: CGFloat, backgroundColor:UIColor,borderColor:UIColor)->UIImage{
        let sizeToFit = CGSize(width:Double(self.bounds.size.width), height:Double(self.bounds.size.height))
        let halfBorderWidth = CGFloat(borderWidth/2.0)
        
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, borderWidth)
        CGContextSetStrokeColorWithColor(context, backgroundColor.CGColor)
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
        
        let width = sizeToFit.width, height = sizeToFit.height
        CGContextMoveToPoint(context, width-halfBorderWidth, radius+halfBorderWidth)
        CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);  // 右下角角度
        CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
        CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
        CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius); // 右上角
        
        CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output
    }
}
extension UIImage{
    func kt_drawRectWithRoundedCorner(radius radius:CGFloat, _ sizetoFit:CGSize)->UIImage{
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
        CGContextAddPath(UIGraphicsGetCurrentContext(), UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: radius, height: radius)).CGPath)
        CGContextClip(UIGraphicsGetCurrentContext())
        
        self.drawInRect(rect)
        CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return output
    }
}
extension UIImageView{
    override func kt_addCorner(radius radius: CGFloat) {
        self.image = self.image?.kt_drawRectWithRoundedCorner(radius: radius, self.bounds.size)
    }
}

class testCorner: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let view1 = UIView(frame: CGRectMake(100,100,100,100))
        view1.backgroundColor = UIColor.whiteColor()
        view1.kt_addCorner(radius:16)
        
        self.view.addSubview(view1)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

