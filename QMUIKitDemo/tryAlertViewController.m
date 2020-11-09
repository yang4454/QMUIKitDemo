//
//  tryAlertViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/6.
//

#import "tryAlertViewController.h"
#import <QMUIKit.h>

@interface tryAlertViewController ()

@end

@implementation tryAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)xxxx:(id)sender {
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:NULL];
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:@"删除" style:QMUIAlertActionStyleDestructive handler:NULL];
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"确定删除？" message:@"删除后将无法恢复，请慎重考虑" preferredStyle:QMUIAlertControllerStyleActionSheet];

    
    //自定义
    NSMutableDictionary *titleAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertTitleAttributes];
    titleAttributs[NSForegroundColorAttributeName] = UIColorWhite;
    alertController.alertTitleAttributes = titleAttributs;
    NSMutableDictionary *messageAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertMessageAttributes];
    messageAttributs[NSForegroundColorAttributeName] = UIColorMakeWithRGBA(255, 255, 255, 0.75);
    alertController.alertMessageAttributes = messageAttributs;
    alertController.alertHeaderBackgroundColor = [UIColor blueColor];
    alertController.alertSeparatorColor = alertController.alertButtonBackgroundColor;
    alertController.alertTitleMessageSpacing = 7;
    
    NSMutableDictionary *buttonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertButtonAttributes];
    buttonAttributes[NSForegroundColorAttributeName] = alertController.alertHeaderBackgroundColor;
    alertController.alertButtonAttributes = buttonAttributes;
    
    NSMutableDictionary *cancelButtonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertCancelButtonAttributes];
    cancelButtonAttributes[NSForegroundColorAttributeName] = buttonAttributes[NSForegroundColorAttributeName];
    alertController.alertCancelButtonAttributes = cancelButtonAttributes;
    
    
//    [action2.button setImage:[[UIImageMake(@"icon_emotion") qmui_imageResizedInLimitedSize:CGSizeMake(18, 18) resizingMode:QMUIImageResizingModeScaleToFill] qmui_imageWithTintColor:[UIColor blueColor]] forState:UIControlStateNormal];
//    action2.button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    //自定义end
    
    
    [alertController addAction:action1];
    [alertController addAction:action2];
    
//    //磨砂
//    QMUIVisualEffectView *visualEffectView = [[QMUIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
//    visualEffectView.foregroundColor = UIColorMakeWithRGBA(255, 255, 255, .7);// 一般用默认值就行，不用主动去改，这里只是为了展示用法
//    alertController.mainVisualEffectView = visualEffectView;
//    alertController.alertHeaderBackgroundColor = nil;
//    // 当你需要磨砂的时候请自行去掉这几个背景色，不然这些背景色会盖住磨砂
//    alertController.alertButtonBackgroundColor = nil;
//    //磨砂end
    

//    //输入框
//    [alertController addTextFieldWithConfigurationHandler:^(QMUITextField * _Nonnull textField) {
//        textField.placeholder = @"姓";
//    }];
//    [alertController addTextFieldWithConfigurationHandler:^(QMUITextField * _Nonnull textField) {
//        textField.placeholder = @"名";
//    }];
//    //输入框
    
//    //自定义内容
//    UIView *customView = [self animationView];
//    [alertController addCustomView:customView];
//    //自定义内容
    
    [alertController showWithAnimated:YES];
}

- (UIView *)animationView {
    
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 95, 30)];
    
    UIView  *shapeView1= [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView1.backgroundColor = UIColorGreen;
    shapeView1.layer.cornerRadius = 8;
    [animationView addSubview:shapeView1];
    
    UIView *shapeView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView2.backgroundColor = UIColorRed;
    shapeView2.layer.cornerRadius = 8;
    [animationView addSubview:shapeView2];
    
    UIView *shapeView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView3.backgroundColor = UIColorBlue;
    shapeView3.layer.cornerRadius = 8;
    [animationView addSubview:shapeView3];
    
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animation];
    positionAnimation.keyPath = @"position.x";
    positionAnimation.values = @[ @-5, @0, @10, @40, @70, @80, @75 ];
    positionAnimation.keyTimes = @[ @0, @(5 / 90.0), @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @(85 / 90.0), @1 ];
    positionAnimation.additive = YES;
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.values = @[ @.7, @.9, @1, @.9, @.7 ];
    scaleAnimation.keyTimes = @[ @0, @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @1 ];
    
    CAKeyframeAnimation *alphaAnimation = [CAKeyframeAnimation animation];
    alphaAnimation.keyPath = @"opacity";
    alphaAnimation.values = @[ @0, @1, @1, @1, @0 ];
    alphaAnimation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[positionAnimation, scaleAnimation, alphaAnimation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.repeatCount = HUGE_VALF;
    group.duration = 1.3;
    
    [shapeView1.layer addAnimation:group forKey:@"basic1"];
    group.timeOffset = .43;
    [shapeView2.layer addAnimation:group forKey:@"basic2"];
    group.timeOffset = .86;
    [shapeView3.layer addAnimation:group forKey:@"basic3"];
    
    return animationView;
}

@end
