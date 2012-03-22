//
//  FZAEmployee.h
//  ObjectConfinement
//
//  Created by Graham Lee on 22/03/2012.
//  Copyright (c) 2012 The Lab, O2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZAEmployee : NSObject

@property (nonatomic, strong) NSNumber *salary;

- (void)increaseSalaryBy: (float)increment;

@end
