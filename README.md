# DYRipple: Creating a nice ripple animation.
# Simple Integration

    //  :rect:              Init the frame of the Ripple
    //  :animation:         The duration of the animation
    //  :willFillColor:     Bool to determine if you want to fill the Ripple with the fillColor Property 
    //                      but you can expand this and use a different color if you like

    func singleTapView(tap: UITapGestureRecognizer) {
    
        // Get location of users tap
        let location = tap.locationInView(self.view)
        
        let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, willFillColor: false)
        rippleView.startAnimation()
        rippleView.animationDelegate = self
        self.view.addSubview(rippleView)
    }

The ripple will animate, expanding while fading out, and will remove itself from its superview.
# It removes itself from its superview after the animation

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/TapRipple.gif)

# Using a Timer to create a subtle effect of water droplets

    self.rippleTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "addMiddleRipple:", userInfo: nil, repeats: true)
    
    func addMiddleRipple(sender: NSTimer!) {
        
        let rippleView = DYRipple(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 75.0, CGRectGetMidY(self.view.frame) - 75.0, 150.0, 150.0), animation: 2.0, willFillColor:false)
        self.view.addSubview(rippleView)
    }
    

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/RainRipple.gif)

# Customize the Ripple
Instantiate a DYRipple and change the custom properties

    func singleTapGesture(tap: UITapGestureRecognizer) {
    
        //  Get location of users tap
        let location = tap.locationInView(self.view)

        let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, willFillColor: false)
        
        rippleView.innerColor = UIColor.cyanColor()
        rippleView.outerColor = UIColor.cyanColor()
        rippleView.fillColor = UIColor.cyanColor()
        rippleView.lowRandomValue = 2.0
        rippleView.highRandomValue = 3.0
        
        rippleView.startAnimation()
        
        self.view.addSubview(rippleView)
    }


![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/newCustomGif.gif)
