//
//  UserDetailCell3.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomTextView.h"

@interface UserDetailCell3 : UITableViewCell
{
    UITextField *txtFldDOB;
    UICustomTextView *txtFldAddress;
    UITextField *txtFldCity;
    UITextField *txtFldPostcode;

    UIImageView *icon_dob;
    UIImageView *icon_address;
    UIImageView *icon_city;
    UIImageView *icon_postcode;
}

@property (retain, nonatomic) UITextField *txtFldDOB;
@property (retain, nonatomic) UICustomTextView *txtFldAddress;
@property (retain, nonatomic) UITextField *txtFldCity;
@property (retain, nonatomic) UIImageView *icon_city;
@property (retain, nonatomic) UITextField *txtFldPostcode;

@end
