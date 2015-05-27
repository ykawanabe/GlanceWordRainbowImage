# GlanceWordRainbowImage
![GlanceWordRainbowImage sample image](https://raw.githubusercontent.com/jeffsuke/GlanceWordRainbowImage/master/images/sample.png)

GlanceWordRainbowImage let you draw curved text with any favorite background image. This suits with glance look of Apple Watch.

# Usage

Usage of GlanceWordRainbowImage is similar to CALayer since it's subclass of it. Create an instance of GlanceWordRainbowImage and add whatever the line of texts you want and set with `addArcString (text:String, radius:Double, textColor: UIColor)`the background image with `addBackgroundImage (image: UIImage)`. After that you can generate by calling `generateImage()`. 

* Get Started

```swift
let wordCloudImage: GlanceWordRainbowImage = GlanceWordRainbowImage(size: imageSize)
wordCloudImage.addArcString("円安", radius: 68,
    textColor:UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
wordCloudImage.addArcString("議会演説", radius: 113, textColor:UIColor(red:255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
wordCloudImage.addArcString("Apple WATCH", radius: 161, textColor:UIColor(red:255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
wordCloudImage.addArcString("東京オリンピック", radius: 213, textColor:UIColor(red: 255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
self.image.setImage(wordCloudImage.generateImage())
```

* Create an Instance

```swift
let wordCloudImage: GlanceWordRainbowImage = GlanceWordRainbowImage(size: imageSize)
```

* Add Line of Text

```swift
wordCloudImage.addArcString("Apple WATCH", radius: 161, textColor:UIColor(red:255.0/255.0, green:255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
```

* Add Background Image

```swift
wordCloudImage.addBackgroundImage(UIImage(named: "backgroundImage")!)
```
* Generate UIImage

```swift
wordCloudImage.generateImage()
```


# License

GlanceWordRainbowImage is available under the MIT license. See the [LICENSE file](https://github.com/jeffsuke/GlanceWordRainbowImage/blob/master/LICENSE) for more info.
