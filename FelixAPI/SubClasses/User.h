//
//  User.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject
{
    NSString *UserId;
    NSString *FirstName;
    NSString *LastName;
    NSString *Phone;
    NSString *Email;
    NSString *Gender;
    NSString *City;
    NSString *State;
    NSString *Postcode;
    NSString *DOB;
    NSString *Address;
    UIImageView *ProfilePic;
}

+(User *)sharedUserInstance;

@property(retain, nonatomic) NSString *UserId;
@property(retain, nonatomic) NSString *FirstName;
@property(retain, nonatomic) NSString *LastName;
@property(retain, nonatomic) NSString *Phone;
@property(retain, nonatomic) NSString *Email;
@property(retain, nonatomic) NSString *Gender;
@property(retain, nonatomic) NSString *City;
@property(retain, nonatomic) NSString *State;
@property(retain, nonatomic) NSString *Postcode;
@property(retain, nonatomic) NSString *DOB;
@property(retain, nonatomic) NSString *Address;
@property(retain, nonatomic) UIImageView *ProfilePic;

@end
