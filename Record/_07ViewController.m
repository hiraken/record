//
//  _07ViewController.m
//  Record
//
//  Created by KENJIRO HIRAMATSU on 12/04/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "_07ViewController.h"

@interface _07ViewController ()

@end

@implementation _07ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
