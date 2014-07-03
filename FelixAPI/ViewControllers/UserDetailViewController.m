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

#pragma mark - Initiates
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
@synthesize saveBarButtonItem;
@synthesize apiController;

@synthesize txtFldFirstName;
@synthesize txtFldLastName;
@synthesize txtFldPhone;
@synthesize txtFldEmail;
@synthesize txtFldGender;
@synthesize txtFldAddress;
@synthesize txtFldDOB;
@synthesize txtFldCity;
@synthesize txtFldPostcode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        txtFldFirstName.text = @"";
        txtFldLastName.text = @"";
        txtFldPhone.text = @"";
        txtFldEmail.text = @"";
        txtFldGender.text = @"";
        txtFldAddress.text = @"";
        txtFldDOB.text = @"";
        txtFldCity.text = @"";
        txtFldPostcode.text = @"";
        
        self.Phone = @"";
        self.Email = @"";
        self.DOB = @"";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(updateUserDetail)];
    
    apiController = [[APIController alloc] init];
    apiController.delegate = self;
    
    // Do any additional setup after loading the view from its nib.

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateUserDetail
{
    [self.navigationItem setRightBarButtonItem:nil];
    
    if(apiController == nil)
    {
        apiController = [[APIController alloc] init];
        apiController.delegate = self;
    }
    
    
    if([txtFldGender.text isEqualToString:@""])
        txtFldGender.text = self.Gender;
    
    [apiController updateUserWithUserID:self.UserId
                           firstName:txtFldFirstName.text
                            LastName:txtFldLastName.text
                            phoneNum:txtFldPhone.text
                               email:txtFldEmail.text
                              gender:self.Gender
                                 dob:txtFldDOB.text
                             address:_txtVwAddress.text
                                city:txtFldCity.text
                            postcode:txtFldPostcode.text];
    
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
            return 400;
            break;
        default:
            return 0;
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
        static NSString *cellIdentifier1 = @"pCell";
        UserDetailCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        if(cell1 == nil)
        {
            cell1 = [[UserDetailCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1];
            [cell1 setBackgroundColor:[UIColor clearColor]];
            
            cell1.imgVwPic = self.ProfilePic;
        }
        
        return cell1;
    }
    else if([indexPath row] == 1)
    {
        static NSString *cellIdentifier2 = @"p1Cell";
        UserDetailCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];

        if(cell2 == nil)
        {
            cell2 = [[UserDetailCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
            [cell2 setBackgroundColor:[UIColor clearColor]];
        }
        
        cell2.lblID.text = [NSString stringWithFormat:@"@%@", self.UserId];
        
        self.txtFldFirstName = cell2.txtFldFirstName;
        cell2.txtFldFirstName.text = [NSString stringWithFormat:@"%@", self.FirstName];
        
        self.txtFldLastName = cell2.txtFldLastName;
        cell2.txtFldLastName.text = [NSString stringWithFormat:@"%@", self.LastName];
        
        
        NSLog(@"self.Phone:%@",self.Phone);
        self.txtFldPhone = cell2.txtFldPhone;
        if(self.Phone == (id)[NSNull null] || self.Phone == nil)
            cell2.txtFldPhone.placeholder = @"Insert phone number here.";
        else
            cell2.txtFldPhone.text = [NSString stringWithFormat:@"%@", self.Phone];
        
        self.txtFldEmail = cell2.txtFldEmail;
        if(self.Email == (id)[NSNull null] || self.Email == nil)
            cell2.txtFldEmail.placeholder = @"Insert email here.";
        else
            cell2.txtFldEmail.text = [NSString stringWithFormat:@"%@", self.Email];
        
        cell2.txtFldFirstName.delegate = self;
        cell2.txtFldLastName.delegate = self;
        cell2.txtFldPhone.delegate = self;
        cell2.txtFldEmail.delegate = self;
        
        return cell2;
    }
    else
    {
        static NSString *cellIdentifier3 = @"p2Cell";
        UserDetailCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier3];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        if(cell3 == nil)
        {
            cell3 = [[UserDetailCell3 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
            [cell3 setBackgroundColor:[UIColor clearColor]];
        }
        
        self.txtFldDOB = cell3.txtFldDOB;
        if(self.DOB == (id)[NSNull null])
            cell3.txtFldDOB.placeholder = @"Insert date of birth here.";
        else
            cell3.txtFldDOB.text = [self convertToNiceDate:self.DOB];
        
        _txtVwAddress = [[UITextView alloc] init];
        _txtVwAddress = cell3.txtFldAddress;
        _txtVwAddress.delegate = self;
        [self addDoneToolBarToKeyboard:_txtVwAddress];
        if(self.Address == (id)[NSNull null] || self.Address == nil)
            cell3.txtFldAddress.placeholder = @"Insert address here.";
        else
            cell3.txtFldAddress.text = [NSString stringWithFormat:@"%@", self.Address];
        
        self.txtFldCity = cell3.txtFldCity;
        if(self.City != (id)[NSNull null] || self.City == nil)
            cell3.txtFldCity.text = [NSString stringWithFormat:@"%@", self.City];
        else
            cell3.txtFldCity.placeholder = @"Insert city here.";
        
        self.txtFldPostcode = cell3.txtFldPostcode;
        if(self.Postcode != (id)[NSNull null] || self.Postcode == nil)
            cell3.txtFldPostcode.text = [NSString stringWithFormat:@"%@", self.Postcode];
        else
            cell3.txtFldPostcode.placeholder = @"Insert postcode here.";
        
        cell3.txtFldCity.delegate = self; 
        if(self.City != (id)[NSNull null] || self.City == nil)
            cell3.txtFldCity.placeholder = @"Insert city here.";
        else
            cell3.txtFldCity.text = self.City;
        
//        cell3.txtFldDOB.delegate = self;
//        if(self.DOB != (id)[NSNull null] || self.DOB == nil)
//            cell3.txtFldDOB.placeholder = @"Insert birthday here.";
//        else
//            cell3.txtFldDOB.text = self.DOB;
        
        if(self.Postcode != (id)[NSNull null] || self.Postcode == nil)
            cell3.txtFldPostcode.placeholder = @"Insert postcode here.";
        else
            cell3.txtFldPostcode.delegate = self;
        
        return cell3;
    }
    
}

- (NSString *) convertToNiceDate:(NSString *) dateString
{
    if(dateString != nil)
    {
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
        NSDate *date = [dateFormat dateFromString:dateString];
        
        // Convert date object to desired output format
        [dateFormat setDateFormat:@"dd-MM-yyyy"];
        dateString = [dateFormat stringFromDate:date];
    }
    else
        dateString = @"";
    
    return dateString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self.navigationItem setRightBarButtonItem:saveBarButtonItem];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.navigationItem setRightBarButtonItem:saveBarButtonItem];
}

#pragma mark - Custom TextView Toolbar
/* -------------------------------------------------
 *            Custom TextView Toolbar
 --------------------------------------------------*/
-(void)addDoneToolBarToKeyboard:(UITextView *)textView
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    doneToolbar.barStyle = UIBarStyleBlackTranslucent;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    textView.inputAccessoryView = doneToolbar;
}

//remember to set your text view delegate
//but if you only have 1 text view in your view controller
//you can simply change currentTextField to the name of your text view
//and ignore this textViewDidBeginEditing delegate method
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _txtVwAddress = textView;
}

-(void)doneButtonClickedDismissKeyboard
{
    [_txtVwAddress resignFirstResponder];
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
}

-(void) didCreatedNewUser:(BOOL )saved
{
}

-(void) didUpdateUser:(BOOL ) updated
{
    if(updated)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:nil
                              message:@"User detail updated"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Fail update user"
                              message:@"Please try again."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)didRemoveUser:(BOOL)removed
{
}

@end
