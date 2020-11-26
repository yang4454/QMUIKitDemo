//
//  twonavigationControllerViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/26.
//

#import "twonavigationControllerViewController.h"

@interface twonavigationControllerViewController ()

@end

@implementation twonavigationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UINavigationControllerBackButtonHandlerProtocol

- (BOOL)shouldPopViewControllerByBackButtonOrPopGesture:(BOOL)byPopGesture {
    // 这里不要做一些费时的操作，否则可能会卡顿。
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"是否返回？" message:@"返回后输入框的数据将不会自动保存" preferredStyle:QMUIAlertControllerStyleAlert];
    QMUIAlertAction *backActioin = [QMUIAlertAction actionWithTitle:@"返回" style:QMUIAlertActionStyleCancel handler:^(QMUIAlertController *aAlertController, QMUIAlertAction *action) {
//        [self.navigationController popViewControllerAnimated:YES];
    }];
    QMUIAlertAction *continueAction = [QMUIAlertAction actionWithTitle:@"继续编辑" style:QMUIAlertActionStyleDefault handler:^(QMUIAlertController *aAlertController, QMUIAlertAction *action) {
        
    }];
    [alertController addAction:backActioin];
    [alertController addAction:continueAction];
    [alertController showWithAnimated:YES];
    return NO;
}
@end
