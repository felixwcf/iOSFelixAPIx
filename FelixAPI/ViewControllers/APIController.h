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
@end

@interface APIController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *responseData;
    id delegate;
}

- (void) getUserAPICall;

@property (nonatomic, retain) id<APIControllerDelegate> delegate;
@property (retain, nonatomic) NSMutableData *responseData;

@end
