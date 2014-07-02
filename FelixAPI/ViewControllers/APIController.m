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
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.103:9000/api/addUser"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:data];
    
    (void) [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

- (void) updateUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                  phoneNum:(NSString *)phone email:(NSString *)_email gender:(NSString *)_gender dob:(NSString *)_dob address:(NSString *)_address city:(NSString *)_city
                  postcode:(NSString *)_postcode
{
    
    NSLog(@"city:%@",_city);
    
    isUpdateUser = YES;
    responseData = [[NSMutableData alloc] init];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:fName, @"FIRST_NAME",
                          lName, @"LAST_NAME",
                          phone ?: [NSNull null], @"PHONE",
                          _city ?: [NSNull null], @"CITY",
                          _email ?: [NSNull null], @"EMAIL",
                          _gender ?: [NSNull null], @"GENDER",
                          _dob ?: [NSNull null], @"DOB",
                          _address ?: [NSNull null], @"ADDRESS",
                          _postcode ?: [NSNull null], @"ZIPCODE",
                          nil];
    
//    NSDictionary *dict = [[NSDictionary alloc] init];
//    
//    dict = @{ @"LAST_NAME": lName,
//              @"FIRST_NAME" : fName,
//              @"PHONE" : phone,
//              @"EMAIL" : _email,
//              @"GENDER" : _gender,
//              @"DOB" : _dob,
//              @"ADDRESS" : _address,
//              @"CITY" : _city,
//              @"ZIPCODE" : _postcode,
//           };
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
      NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       NSLog(@"new json::%@",jsonString);
    NSLog(@"userid::%@",userid);
    
    NSString *urlString = [NSString stringWithFormat:@"http://192.168.0.103:9000/api/updateUser/%@", userid];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"PUT"];
    [request addValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:data];
    
    (void) [[NSURLConnection alloc] initWithRequest:request delegate:self];
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
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
    isAddNewUser = NO;
    isUpdateUser = NO;
    responseData = nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    isGetUsers = NO;
    isCheckUserAvailibility = NO;
    isAddNewUser = NO;
    isUpdateUser = NO;
    responseData = nil;
}

@end
