# DYRipple
Creating a nice ripple animation.

/*****************************

    Heres how to use it:

    //  :rect:      Init the frame of the Ripple
    //  :animation: The duration of the animation
    //  :green:     This was used for a specific use case for a project, 
    //              but you can expand this and use a different color if you like
    //              If this Bool is true, the fill color of the ripple will be GREEN
    

    let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, withGreen:false)
    superView.addSubView(rippleView)

    Thats it!

    The ripple will animate, expanding while fading out, and will remove itself from its superview.

*****************************/

![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/Ripple.gif)
