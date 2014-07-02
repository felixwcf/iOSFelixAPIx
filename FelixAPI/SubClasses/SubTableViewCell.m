//
//  SubTableViewCell.m
//  Q2CoreDataTableView
//
//  Created by Felix Wong on 8/16/13.
//  Copyright (c) 2013 Gruden Malaysia. All rights reserved.
//

#import "SubTableViewCell.h"

@implementation SubTableViewCell
@synthesize lblID;
@synthesize lblName;
@synthesize lblPhoneNum;
@synthesize imgVwPic;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imgVwPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"malePic.png"]];
        // Get the Layer of any view
        CALayer * layer = [imgVwPic layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:12.0];
        
        lblName = [[UILabel alloc] initWithFrame:CGRectMake(90, 5, 200, 20)];
        lblName.textAlignment = NSTextAlignmentLeft;
        lblName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0];
        lblName.text = @"";
        lblName.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [lblName setBackgroundColor:[UIColor clearColor]];
        
        lblID = [[UILabel alloc] initWithFrame:CGRectMake(90, 23, 160, 20)];
        [lblID setBackgroundColor:[UIColor clearColor]];
        lblID.textAlignment = NSTextAlignmentLeft;
        lblID.text = @"";
        lblID.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
        lblID.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [lblID setBackgroundColor:[UIColor clearColor]];
        
        lblPhoneNum = [[UILabel alloc] initWithFrame:CGRectMake(90, 42, 160, 20)];
        [lblPhoneNum setBackgroundColor:[UIColor clearColor]];
        lblPhoneNum.textAlignment = NSTextAlignmentLeft;
        lblPhoneNum.text = @"";
        lblPhoneNum.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0];
        lblPhoneNum.textColor = [UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:0.9];
        [lblPhoneNum setBackgroundColor:[UIColor clearColor]];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    imgVwPic.frame = CGRectMake(14, 7,  55, 57);
    [self.contentView addSubview:imgVwPic];
    
    
    [self.contentView addSubview:lblID];
    [self.contentView addSubview:lblName];
    [self.contentView addSubview:lblPhoneNum];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
