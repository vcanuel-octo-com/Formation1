//
//  FOAccountsService.h
//  Formation1
//
//  Created by Vincent Canuel on 21/11/12.
//  Copyright (c) 2012 Formation. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FOAccountsServiceDelegate <NSObject>

@required
- (void)loadingDidSucceedWithAccounts:(NSArray *)accounts;
- (void)loadingDidFailWithMessage:(NSString *)message;

@optional
- (void)loadingDidProgress:(NSUInteger)progression;
- (void)loadingDidSucceedWithImage:(UIImage *)image;

@end

@interface FOAccountsService : NSObject

@property (nonatomic, assign) id<FOAccountsServiceDelegate> delegate;
@property (nonatomic, retain) NSURLConnection   *connection;
@property (nonatomic, retain) NSMutableData     *receivedData;
@property (nonatomic, assign) long long fileSize;

/**************************************************************************************************/
#pragma mark - Utility

+ (NSArray *)loadSubscribedProductsInCache;
- (void)loadSusbcribedProduct;

@end
