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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Récupération des accounts
    NSArray *accounts = [FOAccountsService loadSubscribedProductsInCache];
    FOAccount *anAccount = [accounts lastObject];
	
	NSLog(@"%@",accounts);
	NSLog(@"%@",anAccount);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
