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

NSString * const NORMAL_API = @"http://192.168.0.103:51122/api";
NSString * const ENTITY_FRAMEWORK_API = @"http://192.168.0.103:9000/api";

@implementation APIController
@synthesize responseData;
@synthesize delegate;
@synthesize isGetUsers;
@synthesize isCheckUserAvailibility;
@synthesize isEntityFrameworkAPI;
@synthesize apiURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    isEntityFrameworkAPI = [defaults boolForKey:@"isEntityFrameworkAPI"];
    
    NSLog(@"isEntityFrameworkAPI:%d",isEntityFrameworkAPI);
    
    if(isEntityFrameworkAPI)
        self.apiURL = ENTITY_FRAMEWORK_API;
    else
        self.apiURL = NORMAL_API;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getUserAPICall
{
    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isGetUsers = YES;
        responseData = [[NSMutableData alloc] init];
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users",self.apiURL]];
        
        NSLog(@"url::%@",url);
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        
        (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    }
}

- (void)checkUserAvailability:(NSString *)userId
{
    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isCheckUserAvailibility = YES;
        responseData = [[NSMutableData alloc] init];
        NSString *urlString = [NSString stringWithFormat:@"%@/checkUser/%@", self.apiURL, userId];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        
        (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    }
    else
        [self showNoInternetAlert];
}

- (void) addUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                  phoneNum:(NSString *)phone email:(NSString *)email gender:(NSString *)gender dob:(NSString *)dob address:(NSString *)address city:(NSString *)city
                            postcode:(NSString *)postcode
{
    
    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isAddNewUser = YES;
        responseData = [[NSMutableData alloc] init];

        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:userid, @"USER_ID",
                              fName, @"FIRST_NAME",
                              lName, @"LAST_NAME",
                              phone ?: [NSNull null], @"PHONE",
                              city ?: [NSNull null], @"CITY",
                              email ?: [NSNull null], @"EMAIL",
                              gender ?: [NSNull null], @"GENDER",
                              dob ?: [NSNull null], @"DOB",
                              address ?: [NSNull null], @"ADDRESS",
                              postcode ?: [NSNull null], @"ZIPCODE",
                              nil];

        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"new json::%@",jsonString);
        
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/addUser", self.apiURL]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        [request addValue:@"application/json" forHTTPHeaderField:@"content-type"];
        [request setHTTPBody:data];
        
        (void) [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    else
        [self showNoInternetAlert];
}

- (void) updateUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                  phoneNum:(NSString *)phone email:(NSString *)email gender:(NSString *)gender dob:(NSString *)dob address:(NSString *)address city:(NSString *)city
                  postcode:(NSString *)postcode
{

    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isUpdateUser = YES;
        responseData = [[NSMutableData alloc] init];
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:fName, @"FIRST_NAME",
                              lName, @"LAST_NAME",
                              email ?: [NSNull null], @"EMAIL",
                              gender ?: [NSNull null], @"GENDER",
                              phone ?: [NSNull null], @"PHONE",
                              dob ?: [NSNull null], @"DOB",
                              address ?: [NSNull null], @"ADDRESS",
                              city ?: [NSNull null], @"CITY",
                              @"", @"STATE",
                              postcode ?: [NSNull null], @"ZIPCODE",
                              nil];

        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
          NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
           NSLog(@"new json::%@",jsonString);
        NSLog(@"userid::%@",userid);
        
        NSString *urlString = [NSString stringWithFormat:@"%@/updateUser/%@", self.apiURL, userid];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"PUT"];
        [request addValue:@"application/json" forHTTPHeaderField:@"content-type"];
        [request setHTTPBody:data];
        
        (void) [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    else
        [self showNoInternetAlert];
}

- (void) removeUserFromServer:(NSString *)userid
{
    if(ReachableViaWiFi || ReachableViaWWAN)
    {
        isRemoveUser = YES;
        responseData = [[NSMutableData alloc] init];
        NSString *urlString = [NSString stringWithFormat:@"%@/deleteUser/%@", self.apiURL, userid];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        
        (void) [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    }
    else
        [self showNoInternetAlert];
}

- (void) deserializeJsonString:(NSString *)json
{
   
    
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
    else if(isAddNewUser)
    {
        if([json isEqualToString:@"OK"])
            [self.delegate didCreatedNewUser:YES];
        else
            [self.delegate didCreatedNewUser:NO];
    }
    else if(isUpdateUser)
    {
        if([json isEqualToString:@"OK"])
            [self.delegate didUpdateUser:YES];
        else
            [self.delegate didUpdateUser:NO];
    }
    else if(isRemoveUser)
    {
        if([json isEqualToString:@"OK"])
            [self.delegate didRemoveUser:YES];
        else
            [self.delegate didRemoveUser:NO];
    }
}

- (void) showNoInternetAlert
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"No Internet Connection"
                          message:@"Turn on your Internet connection and try again."
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //[responseData setLength:0];

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    if(!isEntityFrameworkAPI && isGetUsers)
    {
        //Remove '\' character from string
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        
        //Remove first character from string
        jsonString = [jsonString substringFromIndex:1];
        //Remove last character from string
        if ([jsonString length] > 0) {
            jsonString = [jsonString substringToIndex:[jsonString length] - 1];
        }
    }
    
    NSLog(@"json::%@", jsonString);
    
    
    [self deserializeJsonString:jsonString];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
    isAddNewUser = NO;
    isUpdateUser = NO;
    isRemoveUser = NO;
    responseData = nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
    isAddNewUser = NO;
    isUpdateUser = NO;
    isRemoveUser = NO;
    responseData = nil;
}

@end
