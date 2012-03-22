//
//  FZAEmployee.m
//  ObjectConfinement
//
//  Created by Graham Lee on 22/03/2012.
//  Copyright (c) 2012 The Lab, O2. All rights reserved.
//

#import "FZAEmployee.h"

@interface FZAEmployee ()
@property (nonatomic, strong) NSNumber *salary;
@end

@implementation FZAEmployee

@synthesize salary;

- (id)init {
    if (self = [super init]) {
        self.salary = [NSNumber numberWithFloat: 10000.0f];
    }
    return self;
}

- (void)increaseSalaryBy:(float)increment {
    float currentSalary = [self.salary floatValue];
    float targetSalary = currentSalary + increment;
    self.salary = [NSNumber numberWithFloat: targetSalary];
}
@end
