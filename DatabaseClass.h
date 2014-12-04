//
//  DatabaseClass.h
//  QuraniQaida
//
//  Created by M Faheem Rajput on 15/10/2014.
//  Copyright (c) 2014 D-TECH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "GroupsModel.h"
#import "NotificationModel.h"



@interface DatabaseClass : NSObject
{
    
}

@property (nonatomic,strong) FMDatabase *databaseObj;

+ (id)sharedManager;
-(BOOL)saveGroup:(GroupsModel*)groupParam;
-(BOOL)updateGroup:(GroupsModel*)groupParam;
-(BOOL)isGroupFound:(GroupsModel*)groupParam;
-(BOOL)deleteGroup:(GroupsModel*)groupParam;
-(NSMutableArray*)selectAllGroupWithNotification;
-(GroupsModel*)selectGroup:(int)groupId;
-(NSMutableArray*)selectNotificationData:(int)groupIdParam;
-(BOOL)updateGroupStartTime:(GroupsModel*)groupParam;
-(BOOL)deleteGroupWithNotifications:(GroupsModel*)groupParam;

@end
