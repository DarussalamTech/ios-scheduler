//
//  NotificationModel.h
//  NotificationComponent
//
//  Created by M Faheem Rajput on 29/11/2014.
//  Copyright (c) 2014 Dtech Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationModel : NSObject

@property(nonatomic) int notificationId;
@property(nonatomic,strong) NSString * notificationString;
@property(nonatomic) int groupId;
@property(nonatomic,strong)NSDate *notificationFireTime; 
@end
