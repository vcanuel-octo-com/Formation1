//
//  FOAccountsService.m
//  Formation1
//
//  Created by Vincent Canuel on 21/11/12.
//  Copyright (c) 2012 Formation. All rights reserved.
//

#import "FOAccountsService.h"

/* Model */
#import "FOAccount.h"

/* Util */
#import "JSONKit.h"

@interface FOAccountsService(private)

+ (NSArray *)parseSubscribedProductsWithDictionary:(NSDictionary *)resultsDict;

@end

@implementation FOAccountsService

/**************************************************************************************************/
#pragma mark - Utility

+ (NSArray *)loadSubscribedProductsInCache
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"subscribedProducts" ofType:@"json"];
    
    NSString *jsonContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *jsonObject = [jsonContent objectFromJSONString];
    
    return [self parseSubscribedProductsWithDictionary:jsonObject];
}

+ (NSArray *)parseSubscribedProductsWithDictionary:(NSDictionary *)resultsDict
{
    NSMutableArray *subscribedProducts = nil;
    
    if([resultsDict isKindOfClass:[NSDictionary class]])
    {
        subscribedProducts = [NSMutableArray array];
        
        id jsonSubscribedProducts = [resultsDict objectForKey:PRODUCT_ACCOUNT];
        
        if([jsonSubscribedProducts isKindOfClass:[NSArray class]])
        {
            for(NSDictionary *jsonSusbcribedProduct in jsonSubscribedProducts)
            {
                FOAccount *subscribedProduct = [[FOAccount alloc] initWithDictionary:jsonSusbcribedProduct];
                [subscribedProducts addObject:subscribedProduct];
            }
        }
        
    }
    return subscribedProducts;
}


@end
