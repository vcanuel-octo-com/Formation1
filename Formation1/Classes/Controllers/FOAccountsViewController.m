//
//  AccountsViewController.m
//  FormationOcto_Niv1_TP6
//
//  Created by Cedric Pointel on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FOAccountsViewController.h"

#import "FOAccount.h"

@interface FOAccountsViewController ()

@end

@implementation FOAccountsViewController

@synthesize accountService;
@synthesize progressBarLoading;
@synthesize imageView;

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
    // Do any additional setup after loading the view from its nib.
    
    self.accountService = [[FOAccountsService alloc] init];
    self.accountService.delegate = self;
    
}

- (void)viewDidUnload
{
    [self setProgressBarLoading:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/**************************************************************************************************/
#pragma mark - Actions

- (IBAction)loadAccounts:(id)sender
{
    self.progressBarLoading.progress = 0.0;
    self.imageView.image = nil;
    
    [self.accountService loadSusbcribedProduct];
}

/**************************************************************************************************/
#pragma mark - FOAccountServiceDelegate

- (void)loadingDidSucceedWithAccounts:(NSArray *)accounts
{
    for(FOAccount *account in accounts)
    {
        DLog(@"%@",account);
    }
}

- (void)loadingDidFailWithMessage:(NSString *)message
{
    FOAlertMessage(@"Erreur", message);
}

- (void)loadingDidProgress:(NSUInteger)progression
{
    self.progressBarLoading.progress = (progression / 100.0);
}

- (void)loadingDidSucceedWithImage:(UIImage *)image
{
    self.imageView.image = image;
}

@end
