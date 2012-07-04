//
//  CatKitUI.h
//  CatKit
//
//  Created by Andrew Smith on 10/27/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#ifndef CatKit_CatKitUI_h
#define CatKit_CatKitUI_h

#import "UIView+Position.h"
#import "UIView+Insert.h"

void RandomlyColorSubviewsOfView(UIView *view) {
    for (UIView *sv in view.subviews) {
        
        CGFloat r = (arc4random() % 255) / 255.0;
        CGFloat g = (arc4random() % 255) / 255.0;
        CGFloat b = (arc4random() % 255) / 255.0;
        
        sv.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        
        RandomlyColorSubviewsOfView(sv);
    }
}

#endif
