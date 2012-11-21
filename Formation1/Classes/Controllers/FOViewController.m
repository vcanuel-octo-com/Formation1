//
//  FOViewController.m
//  Formation1
//
//  Created by Vincent Canuel on 21/11/12.
//  Copyright (c) 2012 Formation. All rights reserved.
//

#import "FOViewController.h"

// Model
#import "FOAccount.h"

// Service
#import "FOAccountsService.h"

@interface FOViewController ()

@end

@implementation FOViewController

- (void)viewDidLoad
{
    DTrace();
    [super viewDidLoad];
	
	// Récupération des accounts
    NSArray *accounts = [FOAccountsService loadSubscribedProductsInCache];
    FOAccount *anAccount = [accounts lastObject];
	
	NSLog(@"%@",accounts);
	NSLog(@"%@",anAccount);
	
	// Création d'un label
    UILabel *labelProductName = [[UILabel alloc] init];
    [labelProductName setFrame:CGRectMake(0,
                                          0,
                                          CGRectGetWidth(self.view.frame),
                                          CGRectGetHeight(self.view.frame))];
    [labelProductName setTextColor:[UIColor whiteColor]];
    [labelProductName setTextAlignment:NSTextAlignmentCenter];
    [labelProductName setText:anAccount.productName];
    [labelProductName setFont:[UIFont systemFontOfSize:30]];
    [labelProductName setBackgroundColor:[UIColor blackColor]];
    [labelProductName setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    
    // Ajout à la vue du controller
    [self.view addSubview:labelProductName];
}

- (void)viewWillAppear:(BOOL)animated
{
    DTrace();
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    DTrace();
    [super viewDidAppear:animated];
}

- (void)viewWillUnload
{
    DTrace();
    [super viewWillUnload];
}

- (void)viewDidUnload
{
    DTrace();
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    DTrace();
    return YES;
    //(interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    DTrace();
    [super didReceiveMemoryWarning];
}

@end
