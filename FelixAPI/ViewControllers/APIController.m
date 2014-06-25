//
//  APIController.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "APIController.h"
#import "User.h"

@interface APIController ()

@end

@implementation APIController
@synthesize responseData;
@synthesize delegate;

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
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getUserAPICall
{
    responseData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.103:9000/api/users"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    
    (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}

- (void) deserializeJsonString:(NSString *)json
{
    NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    // if you are expecting  the JSON string to be in form of array else use NSDictionary instead
    NSMutableArray *values = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
//
    [self.delegate didGetUsersData:values];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    //NSLog(@"json::%@", jsonString);
    
    [self deserializeJsonString:jsonString];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection error");
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connection success");
}

@end
