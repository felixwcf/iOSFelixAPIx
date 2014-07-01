//
//  AddUserTableViewCell.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 7/1/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUserTableViewCell : UITableViewCell
{
    UIImageView *imgVw_userID;
    UIImageView *imgVw_email;
    UIImageView *imgVw_phone;
    UIImageView *imgVw_dob;
    UIImageView *imgVw_address;
    UIImageView *imgVw_city;
    UIImageView *imgVw_postcode;
    
    UITextField *textField;
}

@property(nonatomic, retain) UIImageView *imgVw_userID;
@property(nonatomic, retain) UIImageView *imgVw_email;
@property(nonatomic, retain) UIImageView *imgVw_phone;
@property(nonatomic, retain) UIImageView *imgVw_dob;
@property(nonatomic, retain) UIImageView *imgVw_address;
@property(nonatomic, retain) UIImageView *imgVw_city;
@property(nonatomic, retain) UIImageView *imgVw_postcode;
@property(nonatomic, retain) UITextField *textField;

@end
