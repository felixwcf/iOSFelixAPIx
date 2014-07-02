//
//  AddUserTableViewCell.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 7/1/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "AddUserTableViewCell.h"

@implementation AddUserTableViewCell

@synthesize textField;
@synthesize imgVw_userID;
@synthesize imgVw_email;
@synthesize imgVw_phone;
@synthesize imgVw_dob;
@synthesize imgVw_address;
@synthesize imgVw_city;
@synthesize imgVw_postcode;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imgVw_userID = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_addUser.png"]];
        imgVw_userID.frame = CGRectMake(12, 15,  30, 30);
        // Get the Layer of any view
        CALayer * layer = [imgVw_userID layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:16.0];
        
        imgVw_phone = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_phone.png"]];
        imgVw_phone.frame = CGRectMake(12, 15,  30, 30);
        
        imgVw_email = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_email.png"]];
        imgVw_email.frame = CGRectMake(12, 15,  30, 30);
        
        imgVw_address = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_address.png"]];
        imgVw_address.frame = CGRectMake(12, 15,  30, 30);
        
        imgVw_city = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_city.png"]];
        imgVw_city.frame = CGRectMake(12, 15,  30, 30);
        
        imgVw_postcode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_postcode.png"]];
        imgVw_postcode.frame = CGRectMake(12, 15,  30, 30);
        
        imgVw_dob = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_dob.png"]];
        imgVw_dob.frame = CGRectMake(12, 10,  30, 30);
        
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(70, 8, 200, 40)];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
        textField.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        textField.returnKeyType = UIReturnKeyDone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [textField setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [self.contentView addSubview:textField];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
