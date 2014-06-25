//
//  UserDetailCell2.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailCell2 : UITableViewCell
{
    UILabel *lblID;
    UITextField *txtFldFirstName;
    UITextField *txtFldLastName;
    UITextField *txtFldPhoneNum;
    UITextField *txtFldEmail;
}

@property (retain, nonatomic) UILabel *lblID;
@property (retain, nonatomic) UITextField *txtFldFirstName;
@property (retain, nonatomic) UITextField *txtFldLastName;
@property (retain, nonatomic) UITextField *txtFldPhoneNum;
@property (retain, nonatomic) UITextField *txtFldEmail;

@end
