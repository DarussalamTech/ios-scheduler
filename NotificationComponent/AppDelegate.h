//
//  AppDelegate.h
//  NotificationComponent
//
//  Created by M Faheem Rajput on 27/11/2014.
//  Copyright (c) 2014 Dtech Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationManager.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    UILocalNotification* localNotification;
    NotificationManager *notificationMngrObj;

}
@property (strong, nonatomic) UIWindow *window;



@end

