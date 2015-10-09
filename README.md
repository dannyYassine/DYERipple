# DYRipple: Creating a Ripple animation.
/*
    Animations are slower on the GIFs
*/

# Simple Integration

    //  :rect:              Init the frame of the Ripple
    //  :animation:         The duration of the animation
    //  :willFillColor:     Bool to determine if you want to fill the Ripple with the fillColor Property 
    //                      but you can expand this and use a different color if you like

    func singleTapView(tap: UITapGestureRecognizer) {
    
        // Get the location of users tap
        let location = tap.locationInView(self.view)
        
        let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, willFillColor: false)
        rippleView.startAnimation()
        self.view.addSubview(rippleView)
    }

The ripple will animate, expanding while fading out, and will remove itself from its superview.
# It removes itself from its superview after the animation

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/GIFs/TapRipple.gif)

# Using a Timer to create a subtle effect of water droplets

    self.rippleTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "addMiddleRipple:", userInfo: nil, repeats: true)
    
    func addMiddleRipple(sender: NSTimer!) {
        
        let rippleView = DYRipple(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 75.0, CGRectGetMidY(self.view.frame) - 75.0, 150.0, 150.0), animation: 2.0, willFillColor:false)
        self.view.addSubview(rippleView)
    }
    

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/GIFs/RainRipple.gif)

# Customize the Ripple
Instantiate a DYRipple and change the custom properties

    func singleTapGesture(tap: UITapGestureRecognizer) {
    
        //  Get the location of users tap
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


![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/GIFs/newCustomGif.gif)

/*
    Animations are slower on the GIFs
*/

# Objective-C Compatibility

        DYRipple *ripple = [[DYRipple alloc]initWithFrame:CGRectMake(0, 0, 100, 100) animation:2 willFillColor:NO];
        ripple.innerColor = [UIColor clearColor];
        ripple.outerColor = [UIColor blueColor];
        [self.view addSubview:ripple];
        [ripple startAnimation];


