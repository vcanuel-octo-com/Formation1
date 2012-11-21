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

#define HUGE_FILE_URL @"http://www.lamagiedelasouris.com/actualites/wp-content/uploads/2009/05/disney-pixar-partly-cloudy-image-hd-2.jpg"
#define ACCOUNTS_FILE_URL @"https://dl.dropbox.com/s/676pg17ju7q13n6/subscribedProducts.json?dl=1"
#define BAD_URL @"https://www.googgggggg.fr"


@interface FOAccountsService(private)

+ (NSArray *)parseSubscribedProductsWithDictionary:(NSDictionary *)resultsDict;

@end

@implementation FOAccountsService

/**************************************************************************************************/
#pragma mark - Getters and Setters

@synthesize delegate;
@synthesize connection;
@synthesize receivedData;
@synthesize fileSize;


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

- (void)loadSusbcribedProduct
{
    self.receivedData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:HUGE_FILE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

/**************************************************************************************************/
#pragma mark - NSURLConnectionDelegate

- (void)updateProgressionWithValue:(NSUInteger)progression
{
    DLog(@"Progressed %d",progression);
    if([self.delegate respondsToSelector:@selector(loadingDidProgress:)])
    {
        [self.delegate loadingDidProgress:progression];
    }
}

- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response
{
    self.fileSize = response.expectedContentLength;
    if (self.fileSize == NSURLResponseUnknownLength)
    {
        // Remote file size unknown, using default size (bytes)
        self.fileSize = 1000000;
    }
    
    DLog(@"Filesize %lld bytes.", self.fileSize);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)mdata {
    [self.receivedData appendData: mdata];
    
    NSUInteger progression = [self.receivedData length] * 100 / self.fileSize;
    [self updateProgressionWithValue:progression];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    DLog(@"Finished %d bytes.", [self.receivedData length]);
    
    [self updateProgressionWithValue:100];
    /*if([self.delegate respondsToSelector:@selector(loadingDidSucceedWithAccounts:)])
	 {
	 NSString *jsonString = [[[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding] autorelease];
	 NSDictionary *resultDict = [jsonString objectFromJSONString];
	 NSArray *accounts = [FOAccountService parseSubscribedProductsWithDictionary:resultDict];
	 
	 [self.delegate loadingDidSucceedWithAccounts:accounts];
	 }*/
    if([self.delegate respondsToSelector:@selector(loadingDidSucceedWithImage:)])
    {
        UIImage *image = [UIImage imageWithData:receivedData];
        [self.delegate loadingDidSucceedWithImage:image];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    DLog(@"Failed with error %@",error);
    
    if([self.delegate respondsToSelector:@selector(loadingDidFailWithMessage:)])
    {
        [self.delegate loadingDidFailWithMessage:error.description];
    }
}


@end
