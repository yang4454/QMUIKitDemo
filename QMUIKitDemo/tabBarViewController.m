//
//  tabBarViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/26.
//

#import "tabBarViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"


@interface tabBarViewController ()

@end

@implementation tabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // QMUIKit
    oneViewController *uikitViewController = [[oneViewController alloc] init];
    uikitViewController.hidesBottomBarWhenPushed = NO;
    uikitViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"QMUIKit" image:[UIImageMake(@"icon_tabbar_uikit") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    uikitViewController.tabBarItem.selectedImage = UIImageMake(@"icon_tabbar_uikit_selected");
    
    // UIComponents
    twoViewController *componentViewController = [[twoViewController alloc] init];
    componentViewController.hidesBottomBarWhenPushed = NO;
    componentViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Components" image:[UIImageMake(@"icon_tabbar_component") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:1];
    componentViewController.tabBarItem.selectedImage = UIImageMake(@"icon_tabbar_component_selected");

    
    
    // Lab
    threeViewController *labViewController = [[threeViewController alloc] init];
    labViewController.hidesBottomBarWhenPushed = NO;
    labViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lab" image:[UIImageMake(@"icon_tabbar_lab") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:2];
    labViewController.tabBarItem.selectedImage = UIImageMake(@"icon_tabbar_lab_selected");

    
    self.title = @"QMUI_demo";
    self.viewControllers = @[uikitViewController, componentViewController, labViewController];
    
    
    // 双击 tabBarItem 的回调
    __weak __typeof(self)weakSelf = self;
    void (^tabBarItemDoubleTapBlock)(UITabBarItem *tabBarItem, NSInteger index) = ^(UITabBarItem *tabBarItem, NSInteger index) {
        [QMUITips showInfo:[NSString stringWithFormat:@"双击了第 %@ 个 tab", @(index + 1)] inView:weakSelf.view hideAfterDelay:1.2];
    };
}



@end
