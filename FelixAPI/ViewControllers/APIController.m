//
//  APIController.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "APIController.h"
#import "User.h"
#import "Reachability.h"

@interface APIController ()

@end

@implementation APIController
@synthesize responseData;
@synthesize delegate;
@synthesize isGetUsers;
@synthesize isCheckUserAvailibility;

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
    isGetUsers = YES;
    responseData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.103:9000/api/users"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    
    (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}

- (void)checkUserAvailability:(NSString *)userId
{
    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isCheckUserAvailibility = YES;
        responseData = [[NSMutableData alloc] init];
        NSString *urlString = [NSString stringWithFormat:@"http://192.168.0.103:9000/api/checkUser/%@", userId];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        
        (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    }
}

- (void) addUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                  phoneNum:(NSString *)phone email:(NSString *)email gender:(NSString *)gender dob:(NSString *)dob address:(NSString *)address city:(NSString *)city
                            postcode:(NSString *)postcode
{
    
}

- (void) deserializeJsonString:(NSString *)json
{
    NSLog(@"json::%@",json);
    
    if(isGetUsers)
    {
        NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        // if you are expecting  the JSON string to be in form of array else use NSDictionary instead
        NSMutableArray *values = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        [self.delegate didGetUsersData:values];
    }
    else if(isCheckUserAvailibility)
    {
        
        if([json isEqualToString:@"OK"])
            [self.delegate didGetUserAvailibility:YES];
        else
            [self.delegate didGetUserAvailibility:NO];
    }
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
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connection success");
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
}

@end
