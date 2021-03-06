//
//  APIController.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APIControllerDelegate <NSObject>
-(void) didGetUsersData:(NSMutableArray *)usersArray;
-(void) didGetUserAvailibility:(BOOL )valid;
-(void) didCreatedNewUser:(BOOL )saved;
-(void) didUpdateUser:(BOOL ) updated;
-(void) didRemoveUser:(BOOL ) removed;
@end

extern NSString * const NORMAL_API;
extern NSString * const ENTITY_FRAMEWORK_API;

@interface APIController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *responseData;
    id delegate;
    
    BOOL isGetUsers;
    BOOL isCheckUserAvailibility;
    BOOL isAddNewUser;
    BOOL isUpdateUser;
    BOOL isRemoveUser;
    
    BOOL isEntityFrameworkAPI;
    NSString *apiURL;
    
}

- (void) getUserAPICall;
- (void)checkUserAvailability:(NSString *)userId;
- (void) addUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                  phoneNum:(NSString *)phone email:(NSString *)email gender:(NSString *)gender dob:(NSString *)dob address:(NSString *)address city:(NSString *)city
                  postcode:(NSString *)postcode;
- (void) updateUserWithUserID:(NSString *)userid firstName:(NSString *)fName LastName:(NSString *)lName
                     phoneNum:(NSString *)phone email:(NSString *)email gender:(NSString *)gender dob:(NSString *)dob address:(NSString *)address city:(NSString *)city
                     postcode:(NSString *)postcode;
- (void) removeUserFromServer:(NSString *)userid;

@property (nonatomic, retain) id<APIControllerDelegate> delegate;
@property (retain, nonatomic) NSMutableData *responseData;
@property (assign, nonatomic) BOOL isGetUsers;
@property (assign, nonatomic) BOOL isCheckUserAvailibility;
@property (assign, nonatomic) BOOL isEntityFrameworkAPI;
@property (retain, nonatomic) NSString *apiURL;

@end
