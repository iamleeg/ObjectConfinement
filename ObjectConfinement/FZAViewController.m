//
//  FZAViewController.m
//  ObjectConfinement
//
//  Created by Graham Lee on 03/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FZAViewController.h"
#import "NSObject+FZAConfinementProxy.h"
#import "FZAEmployee.h"

@interface FZAViewController ()

- (void)updateSalaryField: (id)newSalary;

@end

static void *FZAViewControllerEmployeeSalaryContext = &FZAViewControllerEmployeeSalaryContext;

@implementation FZAViewController
{
    FZAEmployee *employee;
}

@synthesize salaryField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.salaryField = [self.salaryField FZA_confinementProxy];
    employee = [[[FZAEmployee alloc] init] FZA_confinementProxy];
    [employee addObserver: self forKeyPath: @"salary" options: NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context: FZAViewControllerEmployeeSalaryContext];
}

- (void)viewDidUnload
{
    [employee removeObserver: self forKeyPath: @"salary"];
    employee = nil;
    self.salaryField = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)applyPayrise:(id)sender {
    [employee increaseSalaryBy: 1000];
}

- (void)updateSalaryField: (id)newSalary {
    salaryField.text = [NSString stringWithFormat: @"%@", newSalary];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == FZAViewControllerEmployeeSalaryContext) {
        id newSalary = [change objectForKey: NSKeyValueChangeNewKey];
        [self updateSalaryField: newSalary];
    }
    else {
        [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
    }
}
@end