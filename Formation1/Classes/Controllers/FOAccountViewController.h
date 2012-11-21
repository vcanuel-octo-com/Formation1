//
//  AccountViewController.h
//  FormationOcto_Niv1_TP4
//
//  Created by Cedric Pointel on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Model
#import "FOAccount.h"

@interface FOAccountViewController : UIViewController

/**************************************************************************************************/
#pragma mark - Getters and Setters

// UI
@property (retain, nonatomic) IBOutlet UILabel *labelProductName;
@property (retain, nonatomic) IBOutlet UILabel *labelHolderName;
@property (retain, nonatomic) IBOutlet UILabel *labelIban;
@property (retain, nonatomic) IBOutlet UILabel *labelBalanceDescription;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedControlAccountType;

/**************************************************************************************************/
#pragma mark - Configure

- (void)configureWithAccount:(FOAccount *)anAccount;

/**************************************************************************************************/
#pragma mark - Actions

- (IBAction)transferMoney:(id)sender;

@end
