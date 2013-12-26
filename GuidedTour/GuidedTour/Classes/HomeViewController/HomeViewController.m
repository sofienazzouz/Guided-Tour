//
//  HomeViewController.m
//  GuidedTour
//
//  Created by sofien azzouz on 24/12/13.
//  Copyright (c) 2013 sofien azzouz. All rights reserved.
//

#import "HomeViewController.h"
#import "GuidedTourViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startVisitButton:(id)sender {
    GuidedTourViewController *guidedVisit = [[GuidedTourViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:guidedVisit];
    [self presentViewController:navController animated:YES completion:nil];
    
}

@end
