//
//  FirstViewController.m
//  SimpleAnimate
//
//  Created by Ned on 3/18/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+UIView_SimpleAnimate.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIView *tmpView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)easeInWithScale:(id)sender
{
    [self.tmpView easeInWithScale];
}

- (IBAction)easeInWithPop:(id)sender
{
    [self.tmpView easeInWithPop];
}

- (IBAction)xRotateTransformIn:(id)sender
{
    [self.tmpView xRotateTransformIn];
}


- (IBAction)popFromButtonWithHeight:(id)sender {
    [self.tmpView popFromButtonWithHeight];
}


- (IBAction)groundBounceAnimationWithHeight:(id)sender
{
}




@end
