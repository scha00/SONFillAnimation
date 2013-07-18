SONFillAnimation
================

`SONFillAnimation` is a class that divides the target UIView into a grid and creates an animation for each piece in a specified order.


Usage
----------------

Example:

    SONFillAnimation *animation = [[SONFillAnimation alloc] initWithNumberOfRows:3 columns:3 animationType:SONFillAnimationTypeDefault];
    animation.direction = SONFillAnimationDirectionLeftToRightAndTopDown;
    animation.duration = 0.3;
    animation.xDelay = 0.1;
    animation.yDelay = 0.2;
    [animation animateView:view completion:^{}];
  
There are two predefined animation type, FoldOut and FoldIn, to begin with, and it is also possible to assign a custom `CAAnimation` object.


XCode 5
----------------

You need XCode 5 DP to open this project as it uses asset catalogs.  
All methods & properties are commented by using a new documentation commenting feature in XCode 5.


Setting
----------------

`numberOfRows` is a property that indicates number of Y slices.  
`numberOfColumns` is a property that indicates number of X slices.  
`duration` is a property that you can assign a duration of a single slice animation.  
`xDelay` is a property that is used as delay between slices in the same row.  
`yDelay` is a property that is used as delay between slices in the same column.  
`anchorPoint` is a property to set an anchor point to each layer slice.  
`direction` is a property that decides the order of slices to be animated in sequence.  

You can assign one of the followings to `direction`:
- SONFillAnimationDirectionLeftToRightAndTopDown
- SONFillAnimationDirectionLeftToRightAndBottomUp
- SONFillAnimationDirectionRightToLeftAndTopDown
- SONFillAnimationDirectionRightToLeftAndBottomUp
- SONFillAnimationDirectionRandom

`animationType` is a property that indicates a type of animation.

You can assign on of the followings to `animationType`:
- SONFillAnimationTypeDefault
- SONFillAnimationTypeFoldOut
- SONFillAnimationTypeFoldIn
- SONFillAnimationTypeCustom

The type `SONFillAnimationTypeDefault` is identical to the type `SONFillAnimationTypeFoldOut`.  
If you would prefer to use a custom `CAAnimation`, set this property to `SONFillAnimationTypeCustom`, and assign a custom `CAAnimation` object to `transformAnimation` property.  

`animateToHide` is a BOOL property that can be used when you're using a custom animation. The alpha property of the animated view will become 0.0 after the animation completes.  
`transformAnimation` is a property that you can assign `CAAnimation` object when using a custom animation.  
`shadeAnimation` is a property that you can assign `CAAnimation` object when using a custom animation. There is an extra shade layer above every slice of the target view, and this animation animates the shade layer.  
`disableShadeAnimation` is a BOOL property that will disable/enable shadeAnimation. The default is NO.  
`shadeColor` is a property that indicates the color of the shade layer.  
`m34` is a property that indicates the m34 value of the view's transform matrix. The default value is 1.0/100.  

`setRotationVector: : :` is a method that defines the rotation vector for FoldIn/FoldOut animations. You do not need to set this value if the animation type is custom. The default value is (0, -1, 0).  


Demo
----------------

- Watch demo: [Youtube](http://youtu.be/tsA6Fu4mPww)


Links
----------------

- Website: [www.soncode.com](http://www.soncode.com)
- Blog: [tumblr.soncode.com](http://tumblr.soncode.com)

