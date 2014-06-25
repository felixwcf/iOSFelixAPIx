//
//  UserDetailCell1.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "UserDetailCell1.h"

@implementation UserDetailCell1
@synthesize imgVwPic;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        imgVwPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"malePic.png"]];
        // Get the Layer of any view
        CALayer * layer = [imgVwPic layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:12.0];
        
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
    
    imgVwPic.frame = CGRectMake(12, 15,  105, 110);
    
    [self.contentView addSubview:imgVwPic];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
