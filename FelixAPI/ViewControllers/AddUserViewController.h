//
//  AddUserViewController.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 7/1/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIController.h"

@interface AddUserViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, APIControllerDelegate>
{
    
    IBOutlet UITableView *addUserTableView;
    
    UITextField *txtFldUserID;
    UITextField *txtFldFirstName;
    UITextField *txtFldLastName;
    UITextField *txtFldEmail;
    UITextField *txtFldPhone;
    UITextField *txtFldGender;
    UITextField *txtFldDOB;
    UITextField *txtFldAddress;
    UITextField *txtFldCity;
    UITextField *txtFldPostcode;
    
    APIController *apiController;
    UIImageView * imgVw_userId_Available;
    
    BOOL isUserIdAvailable;
}

@property(nonatomic, retain) APIController *apiController;

@end
