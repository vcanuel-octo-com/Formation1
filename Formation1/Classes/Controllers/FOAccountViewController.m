//
//  AccountViewController.m
//  FormationOcto_Niv1_TP4
//
//  Created by Cedric Pointel on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FOAccountViewController.h"

@interface FOAccountViewController ()

@end

@implementation FOAccountViewController

/**************************************************************************************************/
#pragma mark - Getters and Setters

// UI
@synthesize labelProductName;
@synthesize labelHolderName;
@synthesize labelIban;
@synthesize labelBalanceDescription;
@synthesize segmentedControlAccountType;

/**************************************************************************************************/
#pragma mark - Birth and Death

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/**************************************************************************************************/
#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLabelProductName:nil];
    [self setLabelHolderName:nil];
    [self setLabelIban:nil];
    [self setLabelBalanceDescription:nil];
    
    [self setSegmentedControlAccountType:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/**************************************************************************************************/
#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/**************************************************************************************************/
#pragma mark - Configure

- (void)configureWithAccount:(FOAccount *)anAccount
{
    self.labelProductName.text = anAccount.productName;
    self.labelHolderName.text = anAccount.holderName;
    self.labelIban.text = anAccount.iban;
    self.labelBalanceDescription.text = [anAccount getFormatedBalance];
    [self.segmentedControlAccountType setSelectedSegmentIndex:anAccount.type-1];
}

/**************************************************************************************************/
#pragma mark - Actions

- (IBAction)transferMoney:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                   message:@"Impossible d'effectuer un virement" 
                                                  delegate:nil
                                         cancelButtonTitle:@"Annuler"
                                         otherButtonTitles:nil];
    [alert show];
}

@end
