//
//  AddUserViewController.m
//  FelixAPI
//
//  Created by Yun Yun Kat on 7/1/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import "AddUserViewController.h"
#import "AddUserTableViewCell.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController
@synthesize apiController;

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
    self.title = @"Add New User";
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addUserIntoDatabse)];
    
    [self.navigationItem setRightBarButtonItem:saveBarButtonItem];
}

- (void) viewWillAppear:(BOOL)animated
{
    isUserIdAvailable = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addUserIntoDatabse
{
    [txtFldUserID resignFirstResponder];
    [txtFldFirstName resignFirstResponder];
    [txtFldLastName resignFirstResponder];
    [txtFldEmail resignFirstResponder];
    [txtFldPhone resignFirstResponder];
    [txtFldGender resignFirstResponder];
    [txtFldDOB resignFirstResponder];
    [txtFldAddress resignFirstResponder];
    [txtFldCity resignFirstResponder];
    [txtFldPostcode resignFirstResponder];
    
    if(isUserIdAvailable && ![txtFldUserID.text isEqualToString:@""]
       && ![txtFldFirstName.text isEqualToString:@""]
       && ![txtFldLastName.text isEqualToString:@""])
    {
        if(apiController== nil)
        {
            apiController = [[APIController alloc] init];
            apiController.delegate = self;
        }
        
        if([txtFldGender.text isEqualToString:@"F"])
        {
            txtFldGender.text = @"F";
        }
        else if([txtFldGender.text isEqualToString:@"M"])
            txtFldGender.text = @"M";
        else
            txtFldGender.text = @"M";
        
        [apiController addUserWithUserID:txtFldUserID.text
                               firstName:txtFldFirstName.text
                                LastName:txtFldLastName.text
                                phoneNum:txtFldPhone.text
                                   email:txtFldEmail.text
                                  gender:txtFldGender.text
                                     dob:txtFldDOB.text
                                 address:txtFldAddress.text
                                    city:txtFldCity.text
                                postcode:txtFldPostcode.text];
    }
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
    return 58;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UCell";
    AddUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[AddUserTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    

    switch (indexPath.row) {
        case 0:
            cell.textField.placeholder = @"User ID";
            txtFldUserID = cell.textField;
            txtFldUserID.delegate = self;
            txtFldUserID.returnKeyType = UIReturnKeyNext;
            imgVw_userId_Available = cell.imgVw_userID;
            [cell.contentView addSubview:cell.imgVw_userID];
            break;
        case 1:
            cell.textField.placeholder = @"First Name";
            txtFldFirstName = cell.textField;
            txtFldFirstName.delegate = self;
            break;
        case 2:
            cell.textField.placeholder = @"Last Name";
            txtFldLastName = cell.textField;
            txtFldLastName.delegate = self;
            break;
        case 3:
            cell.textField.placeholder = @"Phone Number";
            txtFldPhone = cell.textField;
            txtFldPhone.delegate = self;
            [cell.contentView addSubview:cell.imgVw_phone];
            break;
        case 4:
            cell.textField.placeholder = @"Email";
            txtFldEmail = cell.textField;
            txtFldEmail.delegate = self;
            [cell.contentView addSubview:cell.imgVw_email];
            break;
        case 5:
            cell.textField.placeholder = @"Gender";
            txtFldGender = cell.textField;
            txtFldGender.delegate = self;
            break;
        case 6:
            cell.textField.placeholder = @"Address";
            txtFldAddress = cell.textField;
            txtFldAddress.delegate = self;
            [cell.contentView addSubview:cell.imgVw_address];
            break;
        case 7:
            cell.textField.placeholder = @"City";
            txtFldCity = cell.textField;
            txtFldCity.delegate = self;
            [cell.contentView addSubview:cell.imgVw_city];
            break;
        case 8:
            cell.textField.placeholder = @"Postcode";
            txtFldPostcode = cell.textField;
            txtFldPostcode.delegate = self;
            [cell.contentView addSubview:cell.imgVw_postcode];
            break;
        case 9:
            cell.textField.placeholder = @"Date of Birth";
            txtFldDOB = cell.textField;
            txtFldDOB.delegate = self;
            [cell.contentView addSubview:cell.imgVw_dob];
            break;
        default:
            break;
    }
    

    return cell;
}

#pragma mark - UITExtField Delegates
/* -------------------------------------------------
 *            UITExtField Delegates
 --------------------------------------------------*/
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == txtFldUserID)
    {
        if(apiController == nil)
        {
            apiController = [[APIController alloc] init];
            apiController.delegate = self;
        }
        [apiController checkUserAvailability:txtFldUserID.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 100)
    {
        NSLog(@"dismiss");
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark - Custom Delegates
/* -------------------------------------------------
 *            Custom Delegates
 --------------------------------------------------*/
- (void) didGetUsersData:(NSMutableArray *)usersArray
{
}

- (void)didGetUserAvailibility:(BOOL)valid
{
    isUserIdAvailable = valid;
    
    if(valid)
        [imgVw_userId_Available setImage:[UIImage imageNamed:@"icon_userAvailable.png"]];
    else
        [imgVw_userId_Available setImage:[UIImage imageNamed:@"icon_userNotAvailable.png"]];
}

-(void) didCreatedNewUser:(BOOL )saved
{
    if(saved)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:nil
                              message:@"New user created"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
        alert.delegate =self;
        [alert setTag:100];
        [alert show];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Create New User Fail"
                              message:@"Please try again."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)didUpdateUser:(BOOL)updated
{
}

- (void)didRemoveUser:(BOOL)removed
{
}


@end
