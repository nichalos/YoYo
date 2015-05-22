//
//  MyYoYoViewController.m
//  YoYo
//
//  Created by Junfeng Bai on 15/2/13.
//  Copyright (c) 2015年 yoyo. All rights reserved.
//

#import "MyYoYoViewController.h"
#import "PinTypeButton.h"
#import "GerenViewController.h"
#import "loginViewController.h"

@interface MyYoYoViewController (){
    UIImageView *icon;
    UILabel *name;
    UILabel *nameTitle;
    UILabel *labe;
    UIScrollView *scroll;
    NSArray *arrayName;
    UIButton *leftBtn;
    UIView *pinWin;
    PinTypeButton *selectButton;
    UIImageView *noticeView;
    UIImageView *gzBg;
    UILabel *gz;
}

@end

@implementation MyYoYoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(self.view.frame.size.width/2-46, 30, 40, 40);
    [leftBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"top_xr"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"top_xr_dj"] forState:UIControlStateSelected];
    [leftBtn setSelected:YES];
    [self.view addSubview:leftBtn];
    
    title.hidden = YES;
    rightBtn.frame = CGRectMake(self.view.frame.size.width/2+10, 30, 40, 40);
    rightBtn.tag = 1;
    [rightBtn setImage:nil forState:UIControlStateSelected];
    [rightBtn addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:[UIImage imageNamed:@"top_yo"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"top_yo_dj"] forState:UIControlStateSelected];
    if (_myViewType != enumHd) {
        [self initPersonView];
        [self initPinView];
    }else{
        UIButton *backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.backgroundColor = [UIColor clearColor];
        backBtn.tag = 2;
        backBtn.frame = CGRectMake(10, 20, 40, 40);
        [backBtn addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.view addSubview:backBtn];
        leftBtn.hidden = YES;
        title.hidden = NO;
        title.text = @"活动";
        rightBtn.hidden = YES;
        [self initHuodongView];
    }
    [self initNoticeView];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    BOOL islogin = [[NSUserDefaults standardUserDefaults] boolForKey:@"LOGIN"];
    if (!islogin) {
        loginViewController *temp = [[loginViewController alloc] init];
        temp.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:temp animated:NO completion:nil];
    }
}
- (void)backHome:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initNoticeView{
    if (_myViewType == enumHd) {
        noticeView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-386)/2, (self.view.frame.size.height-234)/2, 386, 234)];
        noticeView.image = [UIImage imageNamed:@"pin_win"];
        
        gzBg = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(noticeView.frame)- 103)/2, (CGRectGetHeight(noticeView.frame)- 132)/2, 103, 132)];
        gzBg.image = [UIImage imageNamed:@"gz"];
        
        [noticeView addSubview:gzBg];
        
        gz = [[UILabel alloc] initWithFrame:CGRectMake(110, CGRectGetHeight(gzBg.frame), CGRectGetWidth(noticeView.frame), 132)];
        gz.text = @"恭喜您获得YOYO卡通公仔晕船的小海员！";
        gz.numberOfLines = 0;
        gz.textColor = [UIColor whiteColor];
        gz.textAlignment = NSTextAlignmentJustified;
        [noticeView addSubview:gz];
    }else{
        noticeView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height-63)/2, self.view.frame.size.width-20, 63)];
        noticeView.image = [UIImage imageNamed:@"button"];
        UILabel *notice = [[UILabel alloc] initWithFrame:noticeView.bounds];
        notice.text = @"Ta已经成为你的盘中餐！";
        notice.textColor = [UIColor whiteColor];
        notice.textAlignment = NSTextAlignmentCenter;
        [noticeView addSubview:notice];
    }
    
    noticeView.hidden = YES;
    [self.view addSubview:noticeView];
}

- (void)showNoticeView{
    noticeView.hidden = NO;
    [self performSelector:@selector(hiddenNoticeView) withObject:nil afterDelay:1];
}
- (void)hiddenNoticeView{
    noticeView.hidden = YES;
}

- (void)SelectionBtn:(UIButton *)button{
    
    switch (button.tag) {
        case 0:
        {
            if (button.selected) {
                return;
            }else{
                [button setSelected:YES];
                [rightBtn setSelected:NO];
                _myViewType = enumXr;
                 [self loaddata];
            }
        }
            break;
        case 1:
        {
            
            if (button.selected) {
                return;
            }else{
                [button setSelected:YES];
                [leftBtn setSelected:NO];
                _myViewType = enumYy;
                [self loaddata];
            }
           
        }
            break;
        case 2:
            pinWin.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)initPersonView{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, 150)];
    view.userInteractionEnabled = YES;
    view.image = [UIImage imageNamed:@"pzc_bg"];
    
    icon = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-50, 25, 100, 100)];
    icon.backgroundColor = [UIColor clearColor];
    icon.layer.cornerRadius = 50;
    icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    icon.layer.borderWidth = 3;
    icon.layer.masksToBounds = YES;
    [view addSubview:icon];
    
    
    name = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 40)];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor blackColor];
    name.font = [UIFont systemFontOfSize:20];
    [view addSubview:name];
    
    nameTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(icon.frame)-155, CGRectGetMidY(view.frame)/2-15, 150, 30)];
    nameTitle.textAlignment = NSTextAlignmentRight;
    nameTitle.textColor = [UIColor colorWithRed:187/255.0 green:31/255.0 blue:24/255.0 alpha:1];
    nameTitle.font = [UIFont systemFontOfSize:18];
    
    [view addSubview:nameTitle];
    
    UILabel *namePin = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame)-80, 0, 80, 40)];
    namePin.textAlignment = NSTextAlignmentLeft;
    namePin.textColor = [UIColor colorWithRed:220/255.0 green:87/255.0 blue:80/255.0 alpha:1];;
    namePin.font = [UIFont systemFontOfSize:16];
    namePin.text = @"品小鲜肉";
    [view addSubview:namePin];
    
    UIButton *pin = [UIButton buttonWithType:UIButtonTypeCustom];
    pin.frame = CGRectMake(view.frame.size.width-110, 5, 30, 30);
    [pin setImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
    [pin addTarget:self action:@selector(SelectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    pin.tag = 2;
    [view addSubview:pin];
    
    labe = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(icon.frame)+20, 40, 120, 90)];
    labe.numberOfLines= 0;
    labe.textAlignment = NSTextAlignmentLeft;
    labe.textColor = [UIColor blackColor];
    labe.font = [UIFont systemFontOfSize:16];
    [view addSubview:labe];
    
    [self.view addSubview:view];
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 225, self.view.frame.size.width, self.view.frame.size.height-265)];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scroll];
    [self loaddata];
}

- (void)loaddata{
    if (_myViewType == enumYy) {
        name.text =  @"活跃推荐";
        icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[29]]];
        labe.text =  @"星座：双鱼座\n品尝过158块小鲜肉\n关注了56个新人\n参与过8次活动";
        nameTitle.text = @"Sam Miller";
    }else{
        name.text = @"新人推荐";
        icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",array[40]]];
        labe.text = @"艺人\n星座：魔蝎座\n气质：优雅 古典\n爱好：电影 音乐";
        nameTitle.text = @"Jamie 羊羊";
    }
    if (scroll) {
        [scroll.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    }
    [self initTableView];
}

- (void)initTableView{
    CGFloat width = scroll.frame.size.width/3;
    CGFloat height = 110;
    for (int i = 0; i<40; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i%3*width, i/3*height, width, height)];
        
        UIImageView *iconp = [[UIImageView alloc] initWithFrame:CGRectMake((width-80)/2, 0, 80, 80)];
        
        NSString *imagename = @"";
        if (_myViewType == enumXr) {
            imagename = [NSString stringWithFormat:@"%@.jpg",array[i]];
        }else{
            imagename = [NSString stringWithFormat:@"%d.jpg",i];
        }
        iconp.image = [UIImage imageNamed:imagename];
        [view addSubview:iconp];
        
        UIButton *icon_bg = [[UIButton alloc] initWithFrame:CGRectMake((width-80)/2, 0, 80, 80)];
        icon_bg.tag = 100;
        if (_myViewType == enumXr) {
            [icon_bg setBackgroundImage:[UIImage imageNamed:@"kuang"] forState:UIControlStateNormal] ;
        }else{
            [icon_bg setBackgroundImage:[UIImage imageNamed:@"yokuang"] forState:UIControlStateNormal];
        }
        [icon_bg addTarget:self action:@selector(iconAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:icon_bg];
        
        UIButton *icon_zy = [[UIButton alloc] initWithFrame:CGRectMake(5, 60, 40, 40)];
        
        [icon_zy setBackgroundImage:[UIImage imageNamed:@"pin_z"] forState:UIControlStateNormal];
        icon_zy.tag = 101;
        icon_zy.hidden = YES;
        [icon_zy setTitle:@"主页" forState:UIControlStateNormal];
        icon_zy.titleLabel.font = [UIFont systemFontOfSize:14];
        [icon_zy addTarget:self action:@selector(iconAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:icon_zy];
        
        UIButton *icon_pin = [[UIButton alloc] initWithFrame:CGRectMake(90, 60, 40, 40)];
        icon_pin.tag = 102;
        icon_pin.hidden = YES;
        [icon_pin setBackgroundImage:[UIImage imageNamed:@"pin_p"] forState:UIControlStateNormal];
        [icon_pin addTarget:self action:@selector(iconAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:icon_pin];
        
        
        
        UILabel *namePin = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, width, 20)];
        namePin.textAlignment = NSTextAlignmentCenter;
        namePin.textColor = [UIColor grayColor];;
        namePin.font = [UIFont systemFontOfSize:16];
        namePin.text = array[i];
        [view addSubview:namePin];
        
        
        [scroll addSubview:view];
    }
    scroll.contentSize = CGSizeMake(0, (40/3+1)*height);
    
}
- (void)iconAction:(UIButton *)button{
    UIView *icon_zy = [button.superview viewWithTag:101];
    UIView *icon_pin = [button.superview viewWithTag:102];
    switch (button.tag-100) {
        case 0:
        {
            [button setSelected:!button.selected];
            if (button.selected) {
                icon_zy.hidden = NO;
                icon_pin.hidden = NO;
            }else{
                icon_zy.hidden = YES;
                icon_pin.hidden = YES;
            }
            
        }
            break;
        case 1:
        {
            icon_zy.hidden = YES;
            icon_pin.hidden = YES;
            GerenViewController *temp = [[GerenViewController alloc] init];
            temp.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:temp animated:YES];
        }
            break;
        case 2:
        {
            icon_zy.hidden = YES;
            icon_pin.hidden = YES;
            pinWin.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}

- (void)initHuodongView{
    UITableView *myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-115) style:UITableViewStylePlain];
    myTable.backgroundColor = [UIColor lightGrayColor];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTable];
    
}

- (void)initPinView{
    pinWin = [[UIView alloc] initWithFrame:self.view.bounds];
    pinWin.backgroundColor = [UIColor clearColor];
    pinWin.hidden = YES;
    
    UIImageView *pinBg = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(pinWin.frame)-386)/2, (CGRectGetHeight(pinWin.frame)-234)/2, 386, 234)];
    pinBg.image = [UIImage imageNamed:@"pin_win"];
    pinBg.userInteractionEnabled = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(pinWin.frame), 40)];
    label.text = @"你想怎么品?";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:18];
    [pinBg addSubview:label];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, CGRectGetWidth(pinWin.frame), 1)];
    line.image = [UIImage imageNamed:@"home_h"];
    [pinBg addSubview:line];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 40, pinBg.frame.size.width-40, 140)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    
    NSArray *pinArray = [NSArray arrayWithObjects:@"细嚼慢咽",@"狼吞虎咽",@"囫囵吞枣",@"风卷残云",@"其味无穷",@"饥不择食",@"回味无穷",@"咂嘴舔唇",@"津津有味",@"盆光钵净",@"蚕食鲸吞", @"饿虎扑食", @"茹毛饮血",@"食不甘味",@"大吃大喝", @"疯掠狂食", @"虎口吞食 ",nil];
    for (int i = 0; i<pinArray.count; i++) {
        PinTypeButton *button = [[PinTypeButton alloc] initWithFrame:CGRectMake(i%3*108, i/3*50, 108, 40)];
        button.tag = i;
        button.name.text = pinArray[i];
        [button addTarget:self action:@selector(pinType:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:button];
    }
    [scrollView setContentSize:CGSizeMake(0, pinArray.count/3*50+50)];
    [pinBg addSubview:scrollView];
    
    UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(50, 180, pinBg.frame.size.width-100, 45);
    done.tag = 4;
    [done addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    [done setTitle:@"确定" forState:UIControlStateNormal];
    done.layer.borderColor = [UIColor colorWithWhite:.9 alpha:.5].CGColor;
    done.layer.borderWidth = 2;
    done.layer.cornerRadius = 4;
    done.layer.masksToBounds = YES;
    [pinBg addSubview:done];
    
    
    [pinWin addSubview:pinBg];
    [self.view addSubview:pinWin];
}

- (void)doneAction:(UIButton *)button{
    pinWin.hidden = YES;
    if (selectButton) {
        selectButton.selectView.hidden = YES;
        [selectButton setSelected:NO];
    }
    [self showNoticeView];
}

- (void)pinType:(PinTypeButton *)button{
    if (button.selected) {
        [button setSelected:NO];
        button.selectView.hidden = YES;
    }else{
        [button setSelected:YES];
        button.selectView.hidden = NO;
    }
    if (selectButton && selectButton.tag == button.tag) {
        selectButton = nil;
        return;
    }else{
        selectButton.selectView.hidden = YES;
        [selectButton setSelected:NO];
    }
    selectButton = button;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == pinWin) {
        pinWin.hidden = YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 406;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor clearColor];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(9, 5, 396, 400)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 4;
        view.layer.masksToBounds = YES;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 396, 220)];
        image.tag = 1;
        
        UILabel *nametitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 396, 40)];
        nametitle.tag = 2;
        nametitle.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
        nametitle.textColor = [UIColor whiteColor];
        nametitle.textAlignment = NSTextAlignmentCenter;
        [image addSubview:nametitle];
        [view addSubview:image];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(200, 220, 128, 57);
        button.tag = 3;
        [button addTarget:self action:@selector(cellAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 277, view.frame.size.width, 1)];
        line.image = [UIImage imageNamed:@"home_h"];
        [view addSubview:line];
        
        UIImageView *clock = [[UIImageView alloc] initWithFrame:CGRectMake(20, 285, 20, 20)];
        clock.image = [UIImage imageNamed:@"clock"];
        [view addSubview:clock];
        
        UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(45, 285, 200, 20)];
        time.backgroundColor = [UIColor clearColor];
        time.textColor = [UIColor lightGrayColor];
        time.textAlignment = NSTextAlignmentLeft;
        time.text = @"2015年五月10号";
        [view addSubview:time];
        
        UIImageView *dw = [[UIImageView alloc] initWithFrame:CGRectMake(20, 305, 20, 20)];
        dw.image = [UIImage imageNamed:@"dw"];
        [view addSubview:dw];
        
        UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(45, 305, 200, 20)];
        address.backgroundColor = [UIColor clearColor];
        address.textColor = [UIColor lightGrayColor];
        address.textAlignment = NSTextAlignmentLeft;
        address.text = @"北京";
        [view addSubview:address];
        
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 330, view.frame.size.width, 1)];
        line1.image = [UIImage imageNamed:@"home_h"];
        [view addSubview:line1];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(300, 335, 200, 14)];
        count.backgroundColor = [UIColor clearColor];
        count.textColor = [UIColor colorWithRed:220/255.0 green:87/255.0 blue:80/255.0 alpha:1];
        count.textAlignment = NSTextAlignmentLeft;
        count.text = @"35人报名";
        count.font = [UIFont systemFontOfSize:12];
        [view addSubview:count];
        
        UIButton *buttonBM = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonBM.frame = CGRectMake(10, 350, view.frame.size.width-20, 45);
        buttonBM.tag = 4;
        [buttonBM setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [buttonBM setTitle:@"立即报名" forState:UIControlStateNormal];
        [view addSubview:buttonBM];
        [buttonBM addTarget:self action:@selector(cellAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:view];
        
        
    }
    
    UIImageView *Icon = (UIImageView *)[cell.contentView viewWithTag:1];
    Icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"hd_0%d",(int)indexPath.row+1]];
    UILabel *nametitle = (UILabel *)[Icon viewWithTag:2];
    nametitle.text =@"YO男神和女神互动见面会";
    UIButton *button = (UIButton *)[cell.contentView viewWithTag:3];
    if (indexPath.row == 0) {
        [button setImage:[UIImage imageNamed:@"jy"] forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"dd"] forState:UIControlStateNormal];
    }
    return cell;
}

- (void)cellAction:(UIButton *)button{
    if (button.tag == 3) {
        gzBg.frame = CGRectMake(0, (CGRectGetHeight(noticeView.frame)- 132)/2, 103, 132);
        gz.frame = CGRectMake(110, CGRectGetMinY(gzBg.frame), CGRectGetWidth(noticeView.frame)-120, 132);
        gz.text = @"恭喜您获得YOYO卡通公仔晕船的小海员！";
        gz.textAlignment = NSTextAlignmentJustified;
    }else{
        gzBg.frame = CGRectMake((CGRectGetWidth(noticeView.frame)- 103)/2, (CGRectGetHeight(noticeView.frame)- 132)/2, 0, 0);
        gz.frame = CGRectMake(0, CGRectGetMinY(gzBg.frame), CGRectGetWidth(noticeView.frame), 132);
        gz.textAlignment = NSTextAlignmentCenter;
        gz.text = @"恭喜您报名成功！";
    }
    [self showNoticeView];
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
