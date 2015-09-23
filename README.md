# DYRipple: Creating a nice ripple animation.
# Simple Integration

    //  :rect:              Init the frame of the Ripple
    //  :animation:         The duration of the animation
    //  :willFillColor:     Bool to determine if you want to fill the Ripple with the fillColor Property 
    //                      but you can expand this and use a different color if you like
    
    let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, willFillColor:false)
    superView.addSubView(rippleView)

Thats it! The ripple will animate, expanding while fading out, and will remove itself from its superview.

# Using a Timer to create a subtle effect of the water droplets

    self.rippleTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "addMiddleRipple:", userInfo: nil, repeats: true)
    
    func addMiddleRipple(sender: NSTimer!) {
        
        let rippleView = DYRipple(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 75.0, CGRectGetMidY(self.view.frame) - 75.0, 150.0, 150.0), animation: 2.0, willFillColor:false)
        self.rippleContainer.addSubview(rippleView)
    }
    

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/Ripple.gif)
