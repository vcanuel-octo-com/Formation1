//
//  FOAccount.m
//  Formation1
//
//  Created by Vincent Canuel on 21/11/12.
//  Copyright (c) 2012 Formation. All rights reserved.
//

#import "FOAccount.h"

@implementation FOAccount

/**************************************************************************************************/
#pragma mark - Getters and Setters

@synthesize identifier;
@synthesize productName;
@synthesize holderName;
@synthesize iban;
@synthesize balance;
@synthesize balanceCurrency;
@synthesize type;

/**************************************************************************************************/
#pragma mark - Birth and Death

- (id)initWithDictionary:(NSDictionary *)jsonDict
{
    if(!jsonDict || ![jsonDict isKindOfClass:[NSDictionary class]])
    {
        return nil;
    }
    
    if((self = [super init]))
    {
        id parsedValue;
        
        /* PRODUCT_ACCOUNT_ID */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_ID];
        if([parsedValue isKindOfClass:[NSString class]] &&
           [parsedValue length] > 0)
        {
            self.identifier = parsedValue;
        }
        
        
        /* PRODUCT_ACCOUNT_NAME */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_NAME];
        if([parsedValue isKindOfClass:[NSString class]])
        {
            self.productName = parsedValue;
        }
        
        /* PRODUCT_ACCOUNT_HOLDER */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_HOLDER];
        if([parsedValue isKindOfClass:[NSString class]])
        {
            self.holderName = parsedValue;
        }
        
        /* PRODUCT_ACCOUNT_IBAN */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_IBAN];
        if([parsedValue isKindOfClass:[NSString class]])
        {
            self.iban = parsedValue;
        }
        
        /* PRODUCT_ACCOUNT_BALANCE */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_BALANCE];
        if ([parsedValue isKindOfClass:[NSString class]] &&
            [parsedValue length] > 0)
        {
            self.balance = [NSDecimalNumber decimalNumberWithString:parsedValue];
        }
        
        /* PRODUCT_ACCOUNT_BALANCE_CURRENCY */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_BALANCE_CURRENCY];
        if([parsedValue isKindOfClass:[NSString class]])
        {
            self.balanceCurrency = parsedValue;
        }
        
        /* PRODUCT_ACCOUNT_TYPE */
        parsedValue = [jsonDict objectForKey:PRODUCT_ACCOUNT_TYPE];
        if (parsedValue && [parsedValue isKindOfClass:[NSString class]] && [parsedValue length] > 0)
        {
            NSInteger productID = [parsedValue intValue];
            if (productID == kCurrentAccount || productID == kInvestorsAccount || productID == kSavingAccount)
            {
                self.type = productID;
            }
            else
            {
                NSLog(@"Check validity failed on field : PRODUCT_ACCOUNT_TYPE for : %@",parsedValue);
                return nil;
            }
        }
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"id = %@ \nproductName = %@", identifier, productName];
}

/**************************************************************************************************/
#pragma mark - Utility

- (NSString *)getFormatedBalance
{
    return [NSString stringWithFormat:@"%.2f %@",[balance floatValue], balanceCurrency];
}

@end
