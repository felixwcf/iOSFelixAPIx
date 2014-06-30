//
//  UserDetailViewController.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UserDetailCell1.h"
#import "UserDetailCell2.h"
#import "UserDetailCell3.h"

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController
@synthesize dataTableView;
@synthesize UserId;
@synthesize FirstName;
@synthesize LastName;
@synthesize Phone;
@synthesize Email;
@synthesize Gender;
@synthesize City;
@synthesize State;
@synthesize Postcode;
@synthesize DOB;
@synthesize Address;
@synthesize ProfilePic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegates
/* -------------------------------------------------
 *            Table View
 --------------------------------------------------*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            return 150;
            break;
        case 1:
            return 220;
            break;
        case 2:
            return 500;
            break;
        default:
            return 100;
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[NSString stringWithFormat:@"TCell%ld", (long)[indexPath row]];
    
    if([indexPath row] == 0)
    {
        static NSString *cellIdentifier = @"pCell";
        UserDetailCell1 *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(cell == nil)
        {
            cell = [[UserDetailCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            [cell setBackgroundColor:[UIColor clearColor]];
            
            cell.imgVwPic = self.ProfilePic;
        }
        
        return cell;
    }
    else if([indexPath row] == 1)
    {
        static NSString *cellIdentifier1 = @"p1Cell";
        UserDetailCell2 *cell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];

        if(cell1 == nil)
        {
            cell1 = [[UserDetailCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1];
            [cell1 setBackgroundColor:[UIColor clearColor]];
        }
        
        cell1.lblID.text = [NSString stringWithFormat:@"@%@", self.UserId];
        cell1.txtFldFirstName.text = [NSString stringWithFormat:@"%@", self.FirstName];
        cell1.txtFldLastName.text = [NSString stringWithFormat:@"%@", self.LastName];
        cell1.txtFldPhone.text = [NSString stringWithFormat:@"%@", self.Phone];
        cell1.txtFldEmail.text = [NSString stringWithFormat:@"%@", self.Email];
        
        cell1.txtFldFirstName.delegate = self;
        cell1.txtFldLastName.delegate = self;
        cell1.txtFldPhone.delegate = self;
        cell1.txtFldEmail.delegate = self;
        
        return cell1;
    }
    else
    {
        static NSString *cellIdentifier2 = @"p2Cell";
        UserDetailCell3 *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        if(cell2 == nil)
        {
            cell2 = [[UserDetailCell3 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
            [cell2 setBackgroundColor:[UIColor clearColor]];
        }
        
        return cell2;
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}





@end
