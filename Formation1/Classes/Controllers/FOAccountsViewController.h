//
//  AccountsViewController.h
//  FormationOcto_Niv1_TP6
//
//  Created by Cedric Pointel on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Service
#import "FOAccountsService.h"

@interface FOAccountsViewController : UIViewController <FOAccountsServiceDelegate>

/**************************************************************************************************/
#pragma mark - Getters and Setters

@property (nonatomic, retain) FOAccountsService *accountService;
@property (retain, nonatomic) IBOutlet UIProgressView *progressBarLoading;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

/**************************************************************************************************/
#pragma mark - Actions

- (IBAction)loadAccounts:(id)sender;

@end
