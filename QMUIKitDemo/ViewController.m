//
//  ViewController.m
//  QMUIKitDemo
//
//  Created by Jeff on 2020/11/6.
//

#import "ViewController.h"
#import "nnnnViewController.h"
#import <QMUIKit.h>

@interface ViewController ()<QMUIAlbumViewControllerDelegate,QMUIImagePickerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)zzzz:(id)sender {
    // 创建一个 QMUIAlbumViewController 实例用于呈现相簿列表
    QMUIAlbumViewController *albumViewController = [[QMUIAlbumViewController alloc] init];
    albumViewController.albumViewControllerDelegate = self;
    albumViewController.contentType = QMUIAlbumContentTypeAll;
    albumViewController.title = @"ssss";
//    if ([title isEqualToString:@"选择单张图片"]) {
//        albumViewController.view.tag = SingleImagePickingTag;
//    } else if ([title isEqualToString:@"选择多张图片"]) {
//        albumViewController.view.tag = MultipleImagePickingTag;
//    } else if ([title isEqualToString:@"调整界面"]) {
//        albumViewController.view.tag = ModifiedImagePickingTag;
//        albumViewController.albumTableViewCellHeight = 70;
//    } else {
//        albumViewController.view.tag = NormalImagePickingTag;
//    }
    
    albumViewController.view.tag = 1045;
    
    QMUINavigationController *navigationController = [[QMUINavigationController alloc] initWithRootViewController:albumViewController];
    // 获取最近发送图片时使用过的相簿，如果有则直接进入该相簿
    [albumViewController pickLastAlbumGroupDirectlyIfCan];
    
    
    
//    [self.navigationController pushViewController:albumViewController animated:YES];
    [self presentViewController:navigationController animated:YES completion:NULL];
    
 
    
}
#pragma mark - <QMUIAlbumViewControllerDelegate>

- (QMUIImagePickerViewController *)imagePickerViewControllerForAlbumViewController:(QMUIAlbumViewController *)albumViewController {
    QMUIImagePickerViewController *imagePickerViewController = [[QMUIImagePickerViewController alloc] init];
    imagePickerViewController.imagePickerViewControllerDelegate = self;
    imagePickerViewController.maximumSelectImageCount = 9;
    imagePickerViewController.view.tag = albumViewController.view.tag;
//    if (albumViewController.view.tag == SingleImagePickingTag) {
//        imagePickerViewController.allowsMultipleSelection = NO;
//    }
//    if (albumViewController.view.tag == ModifiedImagePickingTag) {
//        imagePickerViewController.minimumImageWidth = 65;
//    }
    return imagePickerViewController;
}

#pragma mark - <QMUIImagePickerViewControllerDelegate>

- (void)imagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController didFinishPickingImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    // 储存最近选择了图片的相册，方便下次直接进入该相册
    [QMUIImagePickerHelper updateLastestAlbumWithAssetsGroup:imagePickerViewController.assetsGroup ablumContentType:QMUIAlbumContentTypeAll userIdentify:nil];
    
    [self sendImageWithImagesAssetArray:imagesAssetArray];
}

- (QMUIImagePickerPreviewViewController *)imagePickerPreviewViewControllerForImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController {
    QMUIImagePickerPreviewViewController *imagePickerPreviewViewController = [[QMUIImagePickerPreviewViewController alloc] init];
    imagePickerPreviewViewController.delegate = self;
    imagePickerPreviewViewController.view.tag = imagePickerViewController.view.tag;
    return imagePickerPreviewViewController;
}


#pragma mark - <QMUIImagePickerPreviewViewControllerDelegate>

- (void)imagePickerPreviewViewController:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController didCheckImageAtIndex:(NSInteger)index {
    [self updateImageCountLabelForPreviewView:imagePickerPreviewViewController];
}

- (void)imagePickerPreviewViewController:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController didUncheckImageAtIndex:(NSInteger)index {
    [self updateImageCountLabelForPreviewView:imagePickerPreviewViewController];
}

// 更新选中的图片数量
- (void)updateImageCountLabelForPreviewView:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController {
    
}
#pragma mark - 业务方法

- (void)startLoading {
    [QMUITips showLoadingInView:self.view];
}

- (void)startLoadingWithText:(NSString *)text {
    [QMUITips showLoading:text inView:self.view];
}

- (void)stopLoading {
    [QMUITips hideAllToastInView:self.view animated:YES];
}

- (void)showTipLabelWithText:(NSString *)text {
    [self stopLoading];
    [QMUITips showWithText:text inView:self.view hideAfterDelay:1.0];
}

- (void)hideTipLabel {
    [QMUITips hideAllToastInView:self.view animated:YES];
}

- (void)sendImageWithImagesAssetArrayIfDownloadStatusSucceed:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    if ([QMUIImagePickerHelper imageAssetsDownloaded:imagesAssetArray]) {
        // 所有资源从 iCloud 下载成功，模拟发送图片到服务器
        // 显示发送中
        [self showTipLabelWithText:@"发送中"];
        // 使用 delay 模拟网络请求时长
        [self performSelector:@selector(showTipLabelWithText:) withObject:[NSString stringWithFormat:@"成功发送%@个资源", @([imagesAssetArray count])] afterDelay:1.5];
    }
}

- (void)sendImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    __weak __typeof(self)weakSelf = self;
    
    for (QMUIAsset *asset in imagesAssetArray) {
        [QMUIImagePickerHelper requestImageAssetIfNeeded:asset completion:^(QMUIAssetDownloadStatus downloadStatus, NSError *error) {
            if (downloadStatus == QMUIAssetDownloadStatusDownloading) {
                [weakSelf startLoadingWithText:@"从 iCloud 加载中"];
            } else if (downloadStatus == QMUIAssetDownloadStatusSucceed) {
                [weakSelf sendImageWithImagesAssetArrayIfDownloadStatusSucceed:imagesAssetArray];
            } else {
                [weakSelf showTipLabelWithText:@"iCloud 下载错误，请重新选图"];
            }
        }];
    }
}

- (void)setAvatarWithAvatarImage:(UIImage *)avatarImage {
    [self stopLoading];

}

@end
