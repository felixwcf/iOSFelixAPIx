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
        cell2.txtFldFirstName.text = [NSString stringWithFormat:@"%@", self.FirstName];
        cell2.txtFldLastName.text = [NSString stringWithFormat:@"%@", self.LastName];
        cell2.txtFldPhone.text = [NSString stringWithFormat:@"%@", self.Phone];
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
        
        //cell3.txtFldDOB.text = [NSString stringWithFormat:@"%@", self.DOB];
        if(self.DOB == (id)[NSNull null])
            cell3.txtFldDOB.placeholder = @"Insert date of birth here.";
        else
            cell3.txtFldDOB.text = [self convertToNiceDate:self.DOB];
        
        _txtVwAddress = [[UITextView alloc] init];
        _txtVwAddress = cell3.txtFldAddress;
        _txtVwAddress.delegate = self;
        [self addDoneToolBarToKeyboard:_txtVwAddress];
        if(self.Address == (id)[NSNull null] || [self.Address isEqualToString:@""])
            cell3.txtFldAddress.placeholder = @"Insert address here.";
        else
            cell3.txtFldAddress.text = [NSString stringWithFormat:@"%@", self.Address];
        
        
        cell3.txtFldCity.text = [NSString stringWithFormat:@"%@", self.City];
        cell3.txtFldPostcode.text = [NSString stringWithFormat:@"%@", self.Postcode];
        
        return cell3;
    }
    
}

- (NSString *) convertToNiceDate:(NSString *) dateString
{
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateString];
    
    // Convert date object to desired output format
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    dateString = [dateFormat stringFromDate:date];

    return dateString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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


@end
