//
//  navigationControllerViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/26.
//

#import "navigationControllerViewController.h"
#import "twonavigationControllerViewController.h"

@interface navigationControllerViewController ()

@end

@implementation navigationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)push:(id)sender {
    twonavigationControllerViewController *vc = [[twonavigationControllerViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
