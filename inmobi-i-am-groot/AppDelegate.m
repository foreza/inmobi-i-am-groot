//
//  AppDelegate.m
//  inmobi-i-am-groot
//
//  Created by Jason C on 6/4/18.
//  Copyright © 2018 Jason C. All rights reserved.
//


@import InMobiSDK.IMSdk;

#ifndef INMOBI_ACCOUNT_ID
#define INMOBI_ACCOUNT_ID   @"4028cb8b2c3a0b45012c406824e800ba"
#endif

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableDictionary *consentdict=[[NSMutableDictionary alloc]init];
    //consent value needs to be collected from the end user
    [consentdict setObject:@"true" forKey:IM_GDPR_CONSENT_AVAILABLE];
    [consentdict setObject:@1 forKey:@"gdpr"];
    //Initialize InMobi SDK with your account ID
    [IMSdk initWithAccountID:INMOBI_ACCOUNT_ID consentDictionary:consentdict];
    // Do your stuff.
    
    [IMSdk setLogLevel:kIMSDKLogLevelDebug];

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
