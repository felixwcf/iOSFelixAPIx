//
//  SubTableViewCell.h
//  Q2CoreDataTableView
//
//  Created by Felix Wong on 8/16/13.
//  Copyright (c) 2013 Gruden Malaysia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTableViewCell : UITableViewCell
{
    UILabel *lblID;
    UILabel *lblName;
    UILabel *lblPhoneNum;
    
    UIImageView *imgVwPic;

}

@property (retain, nonatomic) UILabel *lblID;
@property (retain, nonatomic) UILabel *lblName;
@property (retain, nonatomic) UILabel *lblPhoneNum;
@property (retain, nonatomic) UIImageView *imgVwPic;

@end
