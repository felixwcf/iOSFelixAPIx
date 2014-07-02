//
//  MainViewController.h
//  FelixAPI
//
//  Created by Yun Yun Kat on 6/25/14.
//  Copyright (c) 2014 Yun Yun Kat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIController.h"

@interface MainViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, APIControllerDelegate>
{
    IBOutlet UITableView *dataTableView;
    IBOutlet UILabel *lblNoData;
    NSMutableArray *dataArray;
    
    IBOutlet UINavigationBar *navBar;
    
    NSString *removeUserId;
}

@property (nonatomic, retain) IBOutlet UITableView *dataTableView;
@property (nonatomic, retain) IBOutlet UILabel *lblNoData;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSString *removeUserId;
@end
