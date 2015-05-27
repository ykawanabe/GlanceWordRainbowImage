//
//  GlanceWordRainbowImage.swift
//  Restaurant
//
//  Created by Yusuke Kawanabe on 2/13/15.
//  Copyright (c) 2015 Yusuke Kawanabe. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class GlanceWordRainbowImage: CALayer {
    let font = UIFont(name: "Helvetica-bold", size: 25.0)
    let defaultTextColor = UIColor(red: 136.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0)
    
    var defaultArcSize = 100.0
    var defaultArcStart = 30.0
    
    let shiftHorizontal: Double = 0.0
    let shiftVertical: Double = 30.0
    
    let fontBoxSize = 28.0
    
    let debugMode = false
    
    init (size:CGSize) {
        super.init()
        self.frame = CGRectMake(0, 0, size.width, size.height)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        self.renderInContext(UIGraphicsGetCurrentContext())
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    func addBackgroundImage (image: UIImage) {
        let imageView = UIImageView(image: image)
        self.addSublayer(imageView.layer)
    }
    
    func degreesToRadians (value:Double) -> Double {
        return value * M_PI / 180.0
    }
    func radiansToDegrees (value:Double) -> Double {
        return value * 180.0 / M_PI
    }
    func addArcString (text:String, radius:Double) {
        self.addArcString(text, radius: radius, textColor: defaultTextColor)
    }
    
    func addArcString (text:String, radius:Double, textColor: UIColor) {
        var text = text
        var arcSize: Double
        var arcStart: Double

        // Calculate circle shown
        var shownCircleLength = self.degreesToRadians(radius) * defaultArcSize
        if radius > Double(self.frame.size.width / 2.0) {
            arcSize = 2 * self.radiansToDegrees(asin(Double(self.frame.size.width / 2.0) / radius)) - 20
            arcStart = 90.0 - arcSize / 2.0
            shownCircleLength = self.degreesToRadians(arcSize) * radius
        } else {
            arcSize = defaultArcSize
            arcStart = defaultArcStart
        }
        
        // Check the max text length
        let maxStringLength = Int(shownCircleLength / fontBoxSize)
        if maxStringLength < count(text) {
            text = (text as NSString).substringWithRange(NSRange(location: 0, length: maxStringLength - 1))
            text = text + "…"
        }
        else {
            let radiusForShortText = self.radiansToDegrees(Double(count(text)) * fontBoxSize / radius)
            arcSize = radiusForShortText
            arcStart = 90.0 - arcSize / 2.0
        }
        
        let xCenter: Double = Double(self.frame.size.width / 2.0)
        let yCenter: Double = Double(self.frame.size.height)
        
        var angle = arcStart
        let angleStep = arcSize / Double(count(text) - 1)
        
        for i in 0 ..< count(text) {
            let c = (text as NSString).substringWithRange(NSRange(location: i, length: 1))

            let xOffset = cos(self.degreesToRadians(angle)) * radius
            let yOffset = -sin(self.degreesToRadians(angle)) * radius
            
            let rotationAngle = -90 + angle;
            
            var textLayer = CATextLayer()
            textLayer.masksToBounds = false
            textLayer.wrapped = false
            
            textLayer.truncationMode = kCATruncationNone
            if self.debugMode {
                textLayer.borderWidth = 1
                textLayer.cornerRadius = 3
                textLayer.borderColor = UIColor.whiteColor().CGColor
            }
            
            let charSize = CGSizeMake(CGFloat(fontBoxSize), CGFloat(fontBoxSize))
            textLayer.frame = CGRectMake(CGFloat(shiftHorizontal + xCenter - xOffset)  - charSize.width / 2, CGFloat(shiftVertical + yCenter + yOffset) - charSize.width / 2, charSize.width, charSize.height)

            textLayer.font = font!.fontName
            textLayer.fontSize = font!.pointSize
            textLayer.foregroundColor = textColor.CGColor
            textLayer.string = c as String
            textLayer.alignmentMode = kCAAlignmentCenter
            
            textLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeRotation(CGFloat(self.degreesToRadians(rotationAngle))))
            self.addSublayer(textLayer)
            angle += angleStep
        }
        
        if debugMode {
            self.backgroundColor = UIColor.redColor().CGColor
        }
    }
}