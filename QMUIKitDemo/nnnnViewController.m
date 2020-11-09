//
//  nnnnViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/6.
//

#import "nnnnViewController.h"
#import "ViewController.h"
@interface nnnnViewController ()

@end

@implementation nnnnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)ssss:(id)sender {
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
