//
//  FOAccount.h
//  Formation1
//
//  Created by Vincent Canuel on 21/11/12.
//  Copyright (c) 2012 Formation. All rights reserved.
//

#import <Foundation/Foundation.h>

// JSON Keys
#define PRODUCT_ACCOUNT @"subscribedProducts"
#define PRODUCT_ACCOUNT_ID @"id"
#define PRODUCT_ACCOUNT_TYPE @"type"
#define PRODUCT_ACCOUNT_NAME @"productName"
#define PRODUCT_ACCOUNT_HOLDER @"holderName"
#define PRODUCT_ACCOUNT_IBAN @"iban"
#define PRODUCT_ACCOUNT_BALANCE @"balance"
#define PRODUCT_ACCOUNT_BALANCE_CURRENCY @"balanceCurrency"

/* Product Sub Family */
typedef enum
{
    kCurrentAccount = 1,
    kSavingAccount = 2,
    kInvestorsAccount = 3,
} FOAccountType;

@interface FOAccount : NSObject
{
    NSString           *identifier;
    NSString           *productName;
    NSString           *holderName;
    NSString           *iban;
    NSDecimalNumber    *balance;
    NSString           *balanceCurrency;
    FOAccountType      type;
}

/**************************************************************************************************/
#pragma mark - Getters and Setters

@property(nonatomic, retain) NSString           *identifier;
@property(nonatomic, retain) NSString           *productName;
@property(nonatomic, retain) NSString           *holderName;
@property(nonatomic, retain) NSString           *iban;
@property(nonatomic, retain) NSDecimalNumber    *balance;
@property(nonatomic, retain) NSString           *balanceCurrency;
@property(nonatomic, assign) FOAccountType      type;

/**************************************************************************************************/
#pragma mark - Birth and Death

- (id)initWithDictionary:(NSDictionary *)jsonDict;

/**************************************************************************************************/
#pragma mark - Utility

- (NSString *)getFormatedBalance;

@end

