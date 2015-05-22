//
//  PushPhotoViewController.m
//  YoYo
//
//  Created by nichalos on 15/5/5.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "PushPhotoViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <AVFoundation/AVFoundation.h>
@interface PushPhotoViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIButton *changeInfo;
    UIButton *changeVedio;
}

@end

@implementation PushPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    changeInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    changeInfo.frame = CGRectMake(21, 255, 60, 60);
    changeInfo.tag = 0;
    changeInfo.backgroundColor = [UIColor clearColor];
    [changeInfo addTarget:self action:@selector(takePictureClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeInfo];
    
    changeVedio = [UIButton buttonWithType:UIButtonTypeCustom];
    changeVedio.frame = CGRectMake(21, 370, 60, 60);
    changeVedio.backgroundColor = [UIColor clearColor];
    changeVedio.tag = 1;
    [changeVedio addTarget:self action:@selector(takePictureClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeVedio];
}
-(void)takePictureClick:(UIButton *)sender{
    if (sender.tag == 0) {
        UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"请选择文件来源"
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"照相机",@"本地相簿",nil];
        [actionSheet showInView:self.view];
    }else{
        UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"请选择文件来源"
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"摄像机",@"本地视频",nil];
        [actionSheet showInView:self.view];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0://照相机
        {
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([title isEqualToString:@"照相机"]) {
                imagePicker.mediaTypes =  [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage,nil];
            }else{
                imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
                imagePicker.videoQuality = UIImagePickerControllerQualityTypeLow;
            }
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        case 1://本地相簿
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            if ([title isEqualToString:@"本地相簿"]) {
                imagePicker.mediaTypes =  [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage,nil];
            }else{
                imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
            }
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        [changeInfo setImage:img forState:UIControlStateNormal];
//        [self performSelector:@selector(saveImage:)  withObject:img afterDelay:0.5];
    }else if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        NSString *videoPath = (NSString *)[[info objectForKey:UIImagePickerControllerMediaURL] path];
//            self.fileData = [NSData dataWithContentsOfFile:videoPath];
        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:videoPath] options:nil];
        AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
        gen.appliesPreferredTrackTransform = YES;
        CMTime time = CMTimeMakeWithSeconds(0.0, 600);
        NSError *error = nil;
        CMTime actualTime;
        CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
        UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
        CGImageRelease(image);
        [changeVedio setImage:thumb forState:UIControlStateNormal];
        }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    //    NSLog(@"保存头像！");
    //    [userPhotoButton setImage:image forState:UIControlStateNormal];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    NSLog(@"imageFile->>%@",imageFilePath);
    success = [fileManager fileExistsAtPath:imageFilePath];
    if(success) {
        success = [fileManager removeItemAtPath:imageFilePath error:&error];
    }
    UIImage *smallImage=[self scaleFromImage:image toSize:CGSizeMake(150.0f, 150.0f)];//将图片尺寸改为80*80
    //    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(93, 93)];
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
    UIImage *selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
    //    [userPhotoButton setImage:selfPhoto forState:UIControlStateNormal];
    [changeInfo setImage:selfPhoto forState:UIControlStateNormal];
}
// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
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
