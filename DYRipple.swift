//
//  DYRipple.swift
//  CarTap
//
//  Created by Danny Yassine on 2015-06-28.
//  Copyright (c) 2015 Danny Yassine. All rights reserved.
//

import UIKit


/*****************************

    Heres how to use it:

    let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, withGreen:false)
    superView.addSubView(rippleView)

    Thats it!

    The ripple will animate, expanding while fading out, and removing it self from its superview.

*****************************/


class DYRipple: UIView {
    
    var animationDelegate: AnyObject?
    var animationDuration: Double
    let willFillColor: Bool
    
    var innerColor: UIColor = UIColor.clearColor()
    var outerColor: UIColor = UIColor.cyanColor()
    
    var fillColor: UIColor = UIColor.greenColor()
    
    // Values to generate random numbers
    var lowRandomValue: Float = 0.1
    var highRandomValue: Float = 4.0
    
    //  Init the frame of the Ripple
    //  :animation: The duration of the animation
    //  :green:     This was used for a specific use case for a project, but you can expand and use a different color if you like
    //              If this Bool is true, the fill color of the ripple will be GREEN
    
    init(frame: CGRect, animation: Double, willFillColor fillColor: Bool) {

        self.animationDuration = animation
        self.willFillColor = fillColor

        super.init(frame: frame)
        
        self.frame = frame
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    func startAnimation() {
        self.addCircleAnimation()
        //        self.addSecondCircleAnimation()
        self.addFadeOut()
        if(!self.willFillColor) {
            self.endView(self.animationDuration)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init code not implemented")
    }
    
    //  Use GCD in order to remove the RIPPLE view from its superView after the duration ends
    
    internal func endView(seconds:Double) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
    }
    
    //  To draw a gradient Radial
    
    internal override func drawRect(rect: CGRect) {
    
        let context = UIGraphicsGetCurrentContext()
        
        let locations: [CGFloat] = [0.7, 1.0]
        var colors = [innerColor.CGColor, outerColor.CGColor]
        if(self.willFillColor) {
            colors = [fillColor.CGColor, outerColor.CGColor]
        }
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradientCreateWithColors(colorspace,
            colors, locations)
        
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        startPoint.x = self.frame.width/2
        startPoint.y = self.frame.height/2
        endPoint.x = self.frame.width/2
        endPoint.y = self.frame.height/2
        let startRadius: CGFloat = 0
        let endRadius: CGFloat = self.frame.width/2
        
        CGContextDrawRadialGradient (context, gradient, startPoint,
            startRadius, endPoint, endRadius,
            CGGradientDrawingOptions.DrawsBeforeStartLocation)
    }
    
    //  Adds a fade out animation
    
    internal func addFadeOut() {
        
        if(!self.willFillColor) {
            UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
                self.alpha = 0.0
            })
        }
    }
    
    //  Animation to expand the view like a "Ripple".... (duh!)
    
    internal func addCircleAnimation() {
        
        let randomNumber = self.randomBetweenNumbers(0.1, secondNum: 4.0)
        
        let circleAnimation = CABasicAnimation(keyPath: "transform.scale")
        circleAnimation.duration = self.animationDuration
        circleAnimation.repeatCount = 1
        circleAnimation.autoreverses = false
        circleAnimation.removedOnCompletion = false
        circleAnimation.fromValue = NSNumber(float: 0.1)
        circleAnimation.toValue = NSNumber(float: randomNumber)
        if(self.willFillColor) {
            circleAnimation.toValue = NSNumber(float: 3)
            circleAnimation.fillMode = kCAFillModeForwards
        }
        circleAnimation.delegate = self.animationDelegate
        self.layer.addAnimation(circleAnimation, forKey: "scale")
    }
    
    internal func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> Float {
        return Float(CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum))
    }
    
    //  Not used at the moment
    
    internal func addSecondCircleAnimation() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(self.animationDuration/2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {

        }
    }


}
