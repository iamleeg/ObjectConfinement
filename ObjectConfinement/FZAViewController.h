//
//  FZAViewController.h
//  ObjectConfinement
//
//  Created by Graham Lee on 03/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZAViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *salaryField;

- (IBAction)applyPayrise:(id)sender;
@end