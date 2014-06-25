//
//  UserDetailCell2.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "UserDetailCell2.h"

@implementation UserDetailCell2
@synthesize lblID;
@synthesize txtFldFirstName;
@synthesize txtFldLastName;
@synthesize txtFldPhoneNum;
@synthesize txtFldEmail;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        lblID = [[UILabel alloc] initWithFrame:CGRectMake(18, 15, 200, 20)];
        lblID.textAlignment = NSTextAlignmentLeft;
        lblID.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0];
        lblID.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.6];
        [lblID setBackgroundColor:[UIColor clearColor]];
        
        txtFldFirstName = [[UITextField alloc] initWithFrame:CGRectMake(18, 45, 200, 26)];
        txtFldFirstName.textAlignment = NSTextAlignmentLeft;
        txtFldFirstName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        txtFldFirstName.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [txtFldFirstName setBackgroundColor:[UIColor clearColor]];
        
        txtFldLastName = [[UITextField alloc] initWithFrame:CGRectMake(12, 65, 200, 26)];
        txtFldLastName.textAlignment = NSTextAlignmentLeft;
        txtFldLastName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        txtFldLastName.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [txtFldLastName setBackgroundColor:[UIColor clearColor]];
        
        txtFldPhoneNum = [[UITextField alloc] initWithFrame:CGRectMake(12, 95, 200, 26)];
        txtFldPhoneNum.textAlignment = NSTextAlignmentLeft;
        txtFldPhoneNum.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        txtFldPhoneNum.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [txtFldPhoneNum setBackgroundColor:[UIColor clearColor]];
        
        txtFldEmail = [[UITextField alloc] initWithFrame:CGRectMake(12, 105, 200, 26)];
        txtFldEmail.textAlignment = NSTextAlignmentLeft;
        txtFldEmail.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        txtFldEmail.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [txtFldEmail setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)layoutSubviews
{
    [self.contentView addSubview:lblID];
    [self.contentView addSubview:txtFldFirstName];
    [self.contentView addSubview:txtFldLastName];
    [self.contentView addSubview:txtFldPhoneNum];
    [self.contentView addSubview:txtFldEmail];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
