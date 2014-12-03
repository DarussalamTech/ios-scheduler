//
//  GroupsTableViewController.h
//  NotificationComponent
//
//  Created by M Faheem Rajput on 27/11/2014.
//  Copyright (c) 2014 Dtech Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupsModel.h"
#import "DatabaseClass.h"
#import "AddGroupViewController.h"
#import "NotificationManager.h"


@interface GroupsTableViewController : UITableViewController <UIAlertViewDelegate>
{
    int selectedIndex;
    NSMutableArray *groupArray;
}


@end
