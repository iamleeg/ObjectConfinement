//
//  FZAAppDelegate.h
//  ObjectConfinement
//
//  Created by Graham Lee on 03/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FZAViewController;

@interface FZAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FZAViewController *viewController;

@end