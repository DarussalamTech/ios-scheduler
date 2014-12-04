//
//  NotificationManager.h
//  NotificationComponent
//
//  Created by M Faheem Rajput on 27/11/2014.
//  Copyright (c) 2014 Dtech Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GroupsModel.h"
#import "DatabaseClass.h"



@interface NotificationManager : NSObject
{
    GroupsModel *selectedGroup;
    NSMutableArray *allNotificationArray;
    
}

@property(nonatomic) BOOL isRepeatOn;

@property(nonatomic) int lastIndex;
@property(nonatomic,strong) NSDate *lastNotificationDate;

-(void)scheduleNotificationsToFillTheBucket;

-(void)updateNotifications;
@end
