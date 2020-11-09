//
//  AppDelegate.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/6.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[[tryAlertViewController alloc] init] ];
    self.window.rootViewController = navi;
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
