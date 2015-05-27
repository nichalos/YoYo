//
//  BasicInfoViewController.m
//  YoYo
//
//  Created by 夏宝梦 on 15/5/18.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "BasicInfoViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
//#import "MyViewController.h"
#import "AppDelegate.h"


@interface BasicInfoViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation BasicInfoViewController



-(void)clickLeftButton
{
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    CGFloat statusBarHeight=0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        statusBarHeight=20;
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0f green:70/255.0f blue:60/255.0 alpha:1.0f];
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(10, 30, 40, 40);
    [start setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    UILabel * info1Label = [[UILabel alloc] init];
    info1Label.frame = CGRectMake(0, 44+statusBarHeight +10, self.view.frame.size.width, 70);
    info1Label.text = @"基本资料";
    info1Label.textAlignment = NSTextAlignmentCenter;
    info1Label.textColor = [UIColor whiteColor];
    info1Label.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:info1Label];
    
    UIImageView * lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(info1Label.frame)+10, self.view.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lineView];
    
    
    UILabel * info2Label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lineView.frame)+30, CGRectGetMaxY(lineView.frame)+70, 150, 40)];
    info2Label.text = @"请上传头像";
    info2Label.textColor = [UIColor whiteColor];
    info2Label.textAlignment = NSTextAlignmentCenter;
    info2Label.font = [UIFont systemFontOfSize:20];
//    info2Label.backgroundColor = [UIColor redColor];
    [self.view addSubview:info2Label];
    
    
    self.photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoBtn.frame = CGRectMake(CGRectGetMaxX(info2Label.frame)+30, CGRectGetMaxY(lineView.frame)+10, 150, 160);
//    [self.photoBtn setTitle:@"+" forState:UIControlStateNormal];
//    [self.photoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.photoBtn.backgroundColor = [UIColor greenColor];
    [self.photoBtn setImage:[UIImage imageNamed:@"headPhoto"] forState:UIControlStateNormal];
    [self.photoBtn addTarget:self action:@selector(takePictureBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.photoBtn];
    

    self.nicknameField = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.photoBtn.frame)+20, self.view.frame.size.width-30, 40+statusBarHeight/4)];
    self.nicknameField.placeholder = NSLocalizedString(@"nicanameField", nil);
    self.nicknameField.borderStyle = UITextBorderStyleRoundedRect;
    self.nicknameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.nicknameField];
    
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString * titleStr = NSLocalizedString(@"completeBtnTitle", nil);
    [completeBtn setTitle: titleStr forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    completeBtn.frame = CGRectMake(CGRectGetMinX(self.nicknameField.frame), CGRectGetMaxY(self.nicknameField.frame)+25, CGRectGetWidth(self.nicknameField.frame), CGRectGetHeight(self.nicknameField.frame));
    completeBtn.backgroundColor = [UIColor whiteColor];
    completeBtn.layer.cornerRadius = 5.0f;
    [completeBtn addTarget:self action:@selector(completeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeBtn];
    
}

-(void)takePictureBtnClicked:(UIButton *)sender{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"照相机", @"本地相册", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSString * titleStr = [actionSheet buttonTitleAtIndex:buttonIndex];
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *)kUTTypeImage, nil];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        case 1:
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *) kUTTypeImage, nil];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * image =  [info objectForKey:UIImagePickerControllerEditedImage];
    [self.photoBtn setImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)completeBtnClicked:(UIButton *)sender{
    [self.nicknameField resignFirstResponder];
    self.userModel.userNickName = self.nicknameField.text;
    
    
    NSLog(@"userInfo = %@",self.userModel);
    
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate loginSuccess];

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
    [self.photoBtn setImage:selfPhoto forState:UIControlStateNormal];
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
