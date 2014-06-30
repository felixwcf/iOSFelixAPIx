//
//  UserDetailCell2.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/30/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "UserDetailCell2.h"

@implementation UserDetailCell2
@synthesize lblID;
@synthesize txtFldFirstName;
@synthesize txtFldLastName;
@synthesize txtFldPhone;
@synthesize txtFldEmail;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        lblID = [[UILabel alloc] initWithFrame:CGRectMake(18, 15, 200, 20)];
        [lblID setBackgroundColor:[UIColor clearColor]];
        lblID.textAlignment = NSTextAlignmentLeft;
        lblID.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0];
        lblID.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.6];
        [lblID setBackgroundColor:[UIColor clearColor]];
        
        txtFldFirstName = [[UITextField alloc] initWithFrame:CGRectMake(18, 45, 240, 32)];
        txtFldFirstName.textAlignment = NSTextAlignmentLeft;
        txtFldFirstName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
        txtFldFirstName.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldFirstName.returnKeyType = UIReturnKeyDone;
        [txtFldFirstName setBackgroundColor:[UIColor clearColor]];
        
        txtFldLastName = [[UITextField alloc] initWithFrame:CGRectMake(18, 80, 240, 32)];
        txtFldLastName.textAlignment = NSTextAlignmentLeft;
        txtFldLastName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
        txtFldLastName.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldLastName.returnKeyType = UIReturnKeyDone;
        [txtFldLastName setBackgroundColor:[UIColor clearColor]];
        
        txtFldPhone = [[UITextField alloc] initWithFrame:CGRectMake(60, 125, 240, 32)];
        txtFldPhone.textAlignment = NSTextAlignmentLeft;
        txtFldPhone.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldPhone.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldPhone.returnKeyType = UIReturnKeyDone;
        [txtFldPhone setBackgroundColor:[UIColor clearColor]];
        
        txtFldEmail = [[UITextField alloc] initWithFrame:CGRectMake(60, 165, 300, 32)];
        txtFldEmail.textAlignment = NSTextAlignmentLeft;
        txtFldEmail.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldEmail.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldEmail.returnKeyType = UIReturnKeyDone;
        [txtFldEmail setBackgroundColor:[UIColor clearColor]];
        
        icon_phone = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_phone.png"]];
        icon_phone.frame = CGRectMake(18, 125, 28, 28);
        
        icon_email = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_email.png"]];
        icon_email.frame = CGRectMake(18, 165, 29, 29);
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addSubview:icon_phone];
    [self.contentView addSubview:icon_email];
    
    [self.contentView addSubview:lblID];
    [self.contentView addSubview:txtFldFirstName];
    [self.contentView addSubview:txtFldLastName];
    [self.contentView addSubview:txtFldPhone];
    [self.contentView addSubview:txtFldEmail];
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
