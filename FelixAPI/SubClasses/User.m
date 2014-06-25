//
//  User.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "User.h"


@implementation User
@synthesize UserId;
@synthesize FirstName;
@synthesize LastName;
@synthesize Phone;
@synthesize Email;
@synthesize Gender;
@synthesize City;
@synthesize State;
@synthesize Postcode;
@synthesize DOB;
@synthesize Address;
@synthesize ProfilePic;

static User *sharedUserInstance = nil;

// Get the shared instance and create it if necessary.
+ (User *)sharedUserInstance {
    if (sharedUserInstance == nil) {
        sharedUserInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedUserInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        UserId = @"";
        FirstName = @"";
        LastName = @"";
        Phone = @"";
        Email = @"";
        Gender = @"";
        City = @"";
        State = @"";
        Postcode = @"";
        DOB = @"";
        Address = @"";
        ProfilePic = [[UIImageView alloc] init];
    }
    
    return self;
}

// We don't want to allocate a new instance, so return the current one.
+ (id)allocWithZone:(NSZone*)zone {
    return [self sharedUserInstance];
}



@end
