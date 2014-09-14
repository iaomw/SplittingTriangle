//
//  ViewController.m
//  SplittingTriangle
//
//  Created by Sandy Lee on 9/1/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import "ViewController.h"

#import "SplittingTriangle.h"

@interface ViewController ()

@property IBOutlet UISlider *durationSlider;
@property IBOutlet UISwitch *directionSwitch;

@property (strong, nonatomic) SplittingTriangle *st;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:238.0/255 alpha:1]];
    
	self.st = [[SplittingTriangle alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    [self.st setForeColor:[UIColor colorWithRed:25.0/255 green:191.0/255 blue:214.0/255 alpha:1]
             andBackColor:[UIColor clearColor]];
    
    [self.st setClockwise:YES];
    
    [self.st setDuration:2.4];
    
    [self.st setRadius:22];
    
    [self.st setCenter:self.view.center];
    
    [self.view addSubview:self.st];
}

- (IBAction)durationChanged:(UISlider*)sender {
    
    [self.st setDuration:sender.value];
}

- (IBAction)directionChanged:(UISwitch*)sender {
    
    [self.st setClockwise:sender.on];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
