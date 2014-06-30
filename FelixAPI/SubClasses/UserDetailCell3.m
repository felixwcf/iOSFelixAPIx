//
//  UserDetailCell3.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//
// UserDetail Third Row - Detailed Info

#import "UserDetailCell3.h"

@implementation UserDetailCell3
@synthesize txtFldDOB;
@synthesize txtFldAddress;
@synthesize txtFldCity;
@synthesize icon_city;
@synthesize txtFldPostcode;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        txtFldDOB = [[UITextField alloc] initWithFrame:CGRectMake(60, 13, 240, 32)];
        txtFldDOB.textAlignment = NSTextAlignmentLeft;
        txtFldDOB.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldDOB.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldDOB.returnKeyType = UIReturnKeyDone;
        [txtFldDOB setBackgroundColor:[UIColor clearColor]];
        
        txtFldAddress = [[UICustomTextView alloc] initWithFrame:CGRectMake(52, 51, 240, 100)];
        txtFldAddress.textAlignment = NSTextAlignmentLeft;
        txtFldAddress.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldAddress.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldAddress.returnKeyType = UIReturnKeyDone;
        [txtFldAddress setBackgroundColor:[UIColor clearColor]];
        txtFldAddress.placeholderColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.0];
        
        txtFldCity = [[UITextField alloc] initWithFrame:CGRectMake(60, 170, 300, 32)];
        txtFldCity.textAlignment = NSTextAlignmentLeft;
        txtFldCity.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldCity.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [txtFldCity setBackgroundColor:[UIColor clearColor]];
        
        txtFldPostcode = [[UITextField alloc] initWithFrame:CGRectMake(60, 215, 300, 32)];
        txtFldPostcode.textAlignment = NSTextAlignmentLeft;
        txtFldPostcode.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
        txtFldPostcode.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        txtFldPostcode.returnKeyType = UIReturnKeyDone;
        [txtFldPostcode setBackgroundColor:[UIColor clearColor]];
        
        icon_dob = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_dob.png"]];
        icon_dob.frame = CGRectMake(19, 15, 27, 27);
        
        icon_address = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_address.png"]];
        icon_address.frame = CGRectMake(18, 57, 29, 29);
        
        icon_city = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_city.png"]];
        icon_city.frame = CGRectMake(18, 173, 29, 29);

        icon_postcode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_postcode.png"]];
        icon_postcode.frame = CGRectMake(18, 216, 29, 29);
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView addSubview:icon_dob];
    [self.contentView addSubview:icon_address];
    [self.contentView addSubview:icon_city];
    [self.contentView addSubview:icon_postcode];
    
    [self.contentView addSubview:txtFldDOB];
    [self.contentView addSubview:txtFldAddress];
    [self.contentView addSubview:txtFldCity];
    [self.contentView addSubview:txtFldPostcode];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
