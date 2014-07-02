//
//  MainViewController.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "MainViewController.h"
#import "SubTableViewCell.h"
#import "UserDetailViewController.h"
#import "AddUserViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize dataTableView;
@synthesize dataArray;
@synthesize lblNoData;

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
    dataArray = [[NSMutableArray alloc] init];

    // Do any additional setup after loading the view.
    
    CGRect frameimg = CGRectMake(0, 0, 19, 19);
    UIButton *addButton = [[UIButton alloc] initWithFrame:frameimg];
    [addButton setBackgroundImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(launchAddUSerViewController) forControlEvents:UIControlEventTouchUpInside];
    [addButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *btnItem =[[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem=btnItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController getUserAPICall];
}

- (void) launchAddUSerViewController
{
    AddUserViewController *addUserVwController = [[AddUserViewController alloc] init];
    [self.navigationController pushViewController:addUserVwController animated:YES];
    
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
    return 72;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"pCell";//[NSString stringWithFormat:@"TCell%d", indexPath.row];
    SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[SubTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setBackgroundColor:[UIColor clearColor]];
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor colorWithRed:(76.0/255.0) green:(161.0/255.0) blue:(255.0/255.0) alpha:1.0]; // perfect color suggested by @mohamadHafez
        bgColorView.layer.masksToBounds = YES;
        cell.selectedBackgroundView = bgColorView;
    }

    NSMutableDictionary *rowData = [[NSMutableDictionary alloc] init];
    if([dataArray count] != 0)
    {
        rowData = [dataArray objectAtIndex:indexPath.row];
        
        //Male or Female
        NSString *gender = [rowData objectForKey:@"GENDER"];
        if(gender == (id)[NSNull null] || [gender isEqualToString:@"M"])
            cell.imgVwPic.image = [UIImage imageNamed:@"malePic.png"];
        else
            cell.imgVwPic.image = [UIImage imageNamed:@"femalePic.png"];
        
        
        cell.lblName.text = [NSString stringWithFormat:@"%@ %@",[rowData objectForKey:@"FIRST_NAME"], [rowData objectForKey:@"LAST_NAME"]] ;
        cell.lblID.text = [NSString stringWithFormat:@"@%@", [rowData objectForKey:@"USER_ID"]];
        cell.lblPhoneNum.text = [rowData objectForKey:@"PHONE"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableDictionary *rowData = [[NSMutableDictionary alloc] init];
    rowData = [dataArray objectAtIndex:indexPath.row];
    
    SubTableViewCell *ucell = (SubTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    UserDetailViewController *usrDetailViewController = [[UserDetailViewController alloc] init];
    usrDetailViewController.UserId = [rowData objectForKey:@"USER_ID"];
    usrDetailViewController.FirstName = [rowData objectForKey:@"FIRST_NAME"];
    usrDetailViewController.LastName = [rowData objectForKey:@"LAST_NAME"];
    usrDetailViewController.Gender = [rowData objectForKey:@"GENDER"];
    usrDetailViewController.Phone = [rowData objectForKey:@"PHONE"];
    usrDetailViewController.Email = [rowData objectForKey:@"EMAIL"];
    usrDetailViewController.Address = [rowData objectForKey:@"ADDRESS"];
    usrDetailViewController.City = [rowData objectForKey:@"CITY"];
    usrDetailViewController.Postcode = [rowData objectForKey:@"ZIPCODE"];
    usrDetailViewController.DOB = [rowData objectForKey:@"DOB"];
    usrDetailViewController.ProfilePic = ucell.imgVwPic;
    
    [self.navigationController pushViewController:usrDetailViewController animated:YES];
}



#pragma mark - Custom Delegates
/* -------------------------------------------------
 *            Custom Delegates
 --------------------------------------------------*/

- (void)didGetUsersData:(NSMutableArray *)usersArray
{
    NSLog(@"Get users data...");
    dataArray = usersArray;
    [dataTableView reloadData];
}

- (void)didGetUserAvailibility:(BOOL)valid
{
}

- (void)didCreatedNewUser:(BOOL)saved
{
}

-(void)didUpdateUser:(BOOL)updated
{
}

@end
