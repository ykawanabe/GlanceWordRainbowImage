//
//  GlanceController.swift
//  GlanceWordRainbowImageExample WatchKit Extension
//
//  Created by Yusuke Kawanabe on 5/27/15.
//  Copyright (c) 2015 JSK. All rights reserved.
//

import WatchKit
import Foundation

class GlanceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        let imageSize = CGSizeMake(312, 215)

        // create word cloud image
        let wordCloudImage: GlanceWordRainbowImage = GlanceWordRainbowImage(size: imageSize)
        wordCloudImage.addArcString("円安", radius: 68,
            textColor:UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
        wordCloudImage.addArcString("議会演説", radius: 113, textColor:UIColor(red:255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
        wordCloudImage.addArcString("Apple WATCH", radius: 161, textColor:UIColor(red:255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
        wordCloudImage.addArcString("東京オリンピック", radius: 213, textColor:UIColor(red: 255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
        self.image.setImage(wordCloudImage.generateImage())
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
