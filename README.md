# DYRipple
Creating a nice ripple animation.
Heres how to use it:

    //  :rect:              Init the frame of the Ripple
    //  :animation:         The duration of the animation
    //  :willFillColor:     Bool to determine if you want to fill the Ripple with the fillColor Property 
    //                      but you can expand this and use a different color if you like

     
    


    
    let rippleView = DYRipple(frame: CGRectMake(location.x - 75.0, location.y - 75.0, 150.0, 150.0), animation: 0.75, willFillColor:false)
    superView.addSubView(rippleView)

Thats it! The ripple will animate, expanding while fading out, and will remove itself from its superview.



![](https://raw.githubusercontent.com/dannyYassine/DYRipple/master/Ripple.gif)
