//
//  UserDetailViewController.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIController.h"

@interface UserDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UITextFieldDelegate, UITextViewDelegate, APIControllerDelegate>
{
    IBOutlet UITableView *dataTableView;
    
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
    
    UITextField *txtFldFirstName;
    UITextField *txtFldLastName;
    UITextField *txtFldPhone;
    UITextField *txtFldEmail;
    UITextField *txtFldGender;
    UITextField *txtFldAddress;
    UITextField *txtFldDOB;
    UITextField *txtFldCity;
    UITextField *txtFldPostcode;
    
    UITextView *_txtVwAddress;
    
    UIBarButtonItem *saveBarButtonItem;
    APIController *apiController;
    
}

@property (nonatomic, retain) IBOutlet UITableView *dataTableView;

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

@property(retain, nonatomic) UITextField *txtFldFirstName;
@property(retain, nonatomic) UITextField *txtFldLastName;
@property(retain, nonatomic) UITextField *txtFldPhone;
@property(retain, nonatomic) UITextField *txtFldEmail;
@property(retain, nonatomic) UITextField *txtFldGender;
@property(retain, nonatomic) UITextField *txtFldAddress;
@property(retain, nonatomic) UITextField *txtFldDOB;
@property(retain, nonatomic) UITextField *txtFldCity;
@property(retain, nonatomic) UITextField *txtFldPostcode;

@property(retain, nonatomic) UIBarButtonItem *saveBarButtonItem;
@property(retain, nonatomic) APIController *apiController;
@end
