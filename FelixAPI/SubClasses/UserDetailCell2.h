//
//  UserDetailCell2.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/30/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

// UserDetail Second Row - Basic Info

#import <UIKit/UIKit.h>

@interface UserDetailCell2 : UITableViewCell
{
    UILabel *lblID;
    
    UITextField *txtFldFirstName;
    UITextField *txtFldLastName;
    UITextField *txtFldPhone;
    UITextField *txtFldEmail;
    
    UIImageView *icon_phone;
    UIImageView *icon_email;
}

@property (retain, nonatomic) UILabel *lblID;
@property (retain, nonatomic) UITextField *txtFldFirstName;
@property (retain, nonatomic) UITextField *txtFldLastName;
@property (retain, nonatomic) UITextField *txtFldPhone;
@property (retain, nonatomic) UITextField *txtFldEmail;

@end
