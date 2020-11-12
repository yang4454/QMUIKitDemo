//
//  buttonViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/9.
//

#import "buttonViewController.h"
#import <QMUIKit.h>

@interface buttonViewController ()

@property(nonatomic, strong) QMUIButton *normalButton;
@property(nonatomic, strong) QMUIButton *borderedButton;
@property(nonatomic, strong) QMUIButton *imagePositionButton1;
@property(nonatomic, strong) QMUIButton *imagePositionButton2;
@property(nonatomic, strong) CALayer *separatorLayer;
@property(nonatomic, strong) CAShapeLayer *imageButtonSeparatorLayer;

@property(nonatomic, strong) QMUILinkButton *linkButton;

@property(nonatomic, strong) QMUIGhostButton *ghostButton1;

@end
const CGFloat QDButtonSpacingHeight = 72;
@implementation buttonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //方法二，这种方法也是我们经常使用的方法，这样设置为导航栏不透明，导航栏不会遮挡view，并且导航栏颜色表现为白色。
//    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view from its nib.
    self.normalButton = [[QMUIButton alloc] qmui_initWithSize:CGSizeMake(200, 40)];
    self.normalButton.adjustsButtonWhenHighlighted = YES;
    self.normalButton.titleLabel.font = UIFontBoldMake(14);
    [self.normalButton setTitleColor:UIColorWhite forState:UIControlStateNormal];
    self.normalButton.backgroundColor = [UIColor blueColor];
    self.normalButton.highlightedBackgroundColor = [UIColorGreen qmui_transitionToColor:UIColorBlack progress:.15];// 高亮时的背景色
    self.normalButton.layer.cornerRadius = 4;
    [self.normalButton setTitle:@"按钮，支持高亮背景色" forState:UIControlStateNormal];
    [self.view addSubview:self.normalButton];
    
    self.separatorLayer = [CALayer qmui_separatorLayer];
    [self.view.layer addSublayer:self.separatorLayer];
    
    
    //=========================
    self.borderedButton = [[QMUIButton alloc] qmui_initWithSize:CGSizeMake(200, 40)];
    self.borderedButton.titleLabel.font = UIFontBoldMake(14);
    self.borderedButton.tintColorAdjustsTitleAndImage = UIColorGreen;
    self.borderedButton.backgroundColor = [UIColorGreen qmui_transitionToColor:UIColorWhite progress:.9];
    self.borderedButton.highlightedBackgroundColor = [UIColorGreen qmui_transitionToColor:UIColorWhite progress:.75];// 高亮时的背景色
    self.borderedButton.layer.borderColor = [self.borderedButton.backgroundColor qmui_transitionToColor:UIColorGreen progress:.5].CGColor;
    self.borderedButton.layer.borderWidth = 1;
    self.borderedButton.layer.cornerRadius = 4;
    self.borderedButton.highlightedBorderColor = [self.borderedButton.backgroundColor qmui_transitionToColor:UIColorGreen progress:.9];// 高亮时的边框颜色
    
    [self.borderedButton setTitle:@"边框支持高亮的按钮" forState:UIControlStateNormal];
    [self.view addSubview:self.borderedButton];
    
    //============================
    // 图片+文字按钮
    self.imagePositionButton1 = [[QMUIButton alloc] init];
    self.imagePositionButton1.tintColorAdjustsTitleAndImage = UIColorGreen;
    self.imagePositionButton1.imagePosition = QMUIButtonImagePositionTop;// 将图片位置改为在文字上方
    self.imagePositionButton1.spacingBetweenImageAndTitle = 8;
    [self.imagePositionButton1 setImage:UIImageMake(@"icon_emotion") forState:UIControlStateNormal];
    [self.imagePositionButton1 setTitle:@"将图片位置改为在文字上方" forState:UIControlStateNormal];
    self.imagePositionButton1.titleLabel.font = UIFontMake(11);
    self.imagePositionButton1.qmui_borderPosition = QMUIViewBorderPositionTop | QMUIViewBorderPositionBottom;//边框
    [self.view addSubview:self.imagePositionButton1];
    
    //==============================
    self.imagePositionButton2 = [[QMUIButton alloc] init];
    self.imagePositionButton2.tintColorAdjustsTitleAndImage = UIColorGreen;
    self.imagePositionButton2.imagePosition = QMUIButtonImagePositionBottom;// 将图片位置改为在文字下方
    self.imagePositionButton2.spacingBetweenImageAndTitle = 8;
    [self.imagePositionButton2 setImage:UIImageMake(@"icon_emotion") forState:UIControlStateNormal];
    [self.imagePositionButton2 setTitle:@"将图片位置改为在文字下方" forState:UIControlStateNormal];
    self.imagePositionButton2.titleLabel.font = UIFontMake(11);
    self.imagePositionButton2.qmui_borderPosition = QMUIViewBorderPositionTop | QMUIViewBorderPositionBottom;
    [self.view addSubview:self.imagePositionButton2];
    
    
    //虚线
    self.imageButtonSeparatorLayer = [CAShapeLayer qmui_separatorDashLayerWithLineLength:3 lineSpacing:2 lineWidth:PixelOne lineColor:UIColorSeparator.CGColor isHorizontal:NO];
    [self.view.layer addSublayer:self.imageButtonSeparatorLayer];
    
    //==============================
    self.linkButton = [[QMUILinkButton alloc] init];
    self.linkButton.adjustsTitleTintColorAutomatically = YES;
    self.linkButton.tintColor = UIColorGreen;
    self.linkButton.titleLabel.font = UIFontMake(15);
    [self.linkButton setTitle:@"带下划线的按钮" forState:UIControlStateNormal];
    [self.linkButton sizeToFit];
    self.linkButton.underlineColor = UIColorYellow;//修改下划线颜色
    self.linkButton.underlineInsets = UIEdgeInsetsMake(0, 10, 0, 10);//修改下划线的位置
    [self.view addSubview:self.linkButton];
    
    //==============================
    self.ghostButton1 = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorBlue];
    self.ghostButton1.titleLabel.font = UIFontMake(14);
    [self.ghostButton1 setTitle:@"QMUIGhostButtonColorBlue" forState:UIControlStateNormal];
    [self.view addSubview:self.ghostButton1];
    
    //==============================
    
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat contentMinY = self.qmui_navigationBarMaxYInViewCoordinator;
    CGFloat buttonSpacingHeight = QDButtonSpacingHeight;
    
    // 普通按钮
    self.normalButton.frame = CGRectSetXY(self.normalButton.frame, CGFloatGetCenter(CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.normalButton.frame)), contentMinY + CGFloatGetCenter(buttonSpacingHeight, CGRectGetHeight(self.normalButton.frame)));
    
    //线
    self.separatorLayer.frame = CGRectFlatMake(0, contentMinY + buttonSpacingHeight - PixelOne, CGRectGetWidth(self.view.bounds), PixelOne);
    
    // 边框按钮
    self.borderedButton.frame = CGRectSetY(self.normalButton.frame, CGRectGetMaxY(self.separatorLayer.frame) + CGFloatGetCenter(buttonSpacingHeight, CGRectGetHeight(self.normalButton.frame)));
    
    // 图片+文字按钮
    self.imagePositionButton1.frame = CGRectFlatMake(0, contentMinY + buttonSpacingHeight * 2, CGRectGetWidth(self.view.bounds) / 2.0, buttonSpacingHeight);
    self.imagePositionButton2.frame = CGRectSetX(self.imagePositionButton1.frame, CGRectGetMaxX(self.imagePositionButton1.frame));
    
    //虚线
    self.imageButtonSeparatorLayer.frame = CGRectFlatMake(CGRectGetMaxX(self.imagePositionButton1.frame), CGRectGetMinY(self.imagePositionButton1.frame), PixelOne, buttonSpacingHeight);
    
    
    self.linkButton.frame = CGRectFlatMake(0, contentMinY + buttonSpacingHeight * 3, CGRectGetWidth(self.view.bounds), buttonSpacingHeight);
    
    self.ghostButton1.frame = CGRectFlatMake(0, contentMinY + buttonSpacingHeight * 4, CGRectGetWidth(self.view.bounds), buttonSpacingHeight);
    
}

@end
