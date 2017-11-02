//
//  CHBLaunchViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBLaunchViewController.h"
#import "CHBFrontPageModel.h"
#import "AppStartModel.h"

#define CHB_TOP_HEIGHT      MAX(480, (CSCREEN_WIDTH*1120/750))
#define CHB_BOTTOM_HEIGHT   (CSCREEN_WIDTH*308/1080)

static UIWindow *window_;
static CHBLaunchViewController *launchViewController_;

@interface CHBLaunchViewController ()
@property (strong, nonatomic) NSString *currentImageUrl;
@property (strong, nonatomic) UIImageView *frontImageView;  //前面img
@property (strong, nonatomic) UIImageView *bottomImageView; //低img
@property (strong, nonatomic) UIButton *button;
@property (nonatomic, strong) NSTimer *animationTimer;
@end

@implementation CHBLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.hidden = YES;
    // Do any additional setup after loading the view.
    [self setupViews];
    [self loadData];
    [self startTimer];
}

- (void)setupViews
{
    // 下面图片
    self.bottomImageView = [VBase UIImageViewWithFrame:CGRectMake(0, CSCREEN_HEIGHT - CHB_BOTTOM_HEIGHT, CSCREEN_WIDTH,CHB_BOTTOM_HEIGHT) AndImageName:@"bottom" AndbackgroundColor:[UIColor clearColor] AndSuperView:self.view];
    self.bottomImageView.hidden = YES;
    self.bottomImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 上面的图片
    self.frontImageView = [VBase UIImageViewWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, CHB_TOP_HEIGHT) AndImageName:@"front" AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];
    self.frontImageView.userInteractionEnabled = YES;
    self.frontImageView.hidden = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self.frontImageView addGestureRecognizer:tapGesture];
    
    //  跳过按钮
    self.button = [VBase UIButtonWithFrame:CGRectMake(CSCREEN_WIDTH-10-48, 20, 48, 25) AndBackgroundImageName:nil AndTitle:@"跳过" AndTitleColor:[UIColor blackColor] AndSuperView:self.view];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    self.button.clipsToBounds = YES;
    self.button.hidden = YES;
    self.button.layer.cornerRadius = 2.f;
    self.button.backgroundColor = RGBA(0, 0, 0, 0.2);
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonTapped
{
    [self closeView];
}
#pragma mark - 启动页广告
- (void)loadData{
    
//    NSString *url = @"http://api.360che.com/Ad/app/AdForNineBox.aspx?key=52b98275b98bc2225d5c51b75ed16c16&type=4";
//    [CHBNetManager Get:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (responseObject) {
//            NSLog(@"--%@",responseObject);
//            NSDictionary*  data =[[responseObject arrayForKey:@"data"] safeObjectAtIndex:0];
//            
//            CHBFrontPageModel *page = [CHBFrontPageModel loadDataFromJson:data];
//            [AppStartModel sharedInstance].frontPage = page.ImgSrc;
//            [AppStartModel sharedInstance].frontPageUrl = page.ImgUrl;
//            [AppStartModel sharedInstance].type = page.Type;
//            [AppStartModel sharedInstance].Id = page.ID;
//            [self.frontImageView setImageURL:page.ImgSrc placeholderImage:@"front"];
//            
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        ;
//    }];
    
//    [self.frontImageView setImageURL:@"http://tupian.enterdesk.com/uploadfile/2015/0410/20150410102145285.jpg" placeholderImage:@"front"];
    
    __weak typeof(self)   weakself = self;
    
    [self.frontImageView setImageURL:@"http://tupian.enterdesk.com/uploadfile/2015/0410/20150410102145285.jpg" placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        weakself.bottomImageView.hidden = NO;
        weakself.frontImageView.hidden = NO;
        weakself.button.hidden = NO;
        weakself.view.hidden = NO;
    }];
    
}

- (void)startTimer
{
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:4.f target:self selector:@selector(animationTimerDidFired:) userInfo:nil repeats:NO];
}

- (void)animationTimerDidFired:(NSTimer *)timer
{
    if (timer) {
        [timer invalidate];
    }
    
    [self closeView];
}

- (void)closeView
{
    if (![self.view superview]) {
        return;
    }
    
    [UIView animateWithDuration:.5f animations:^{
        self.view.alpha = 0.f;
        window_.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        
        if (window_) {
            launchViewController_ = nil;
            window_.hidden = YES;
            window_ = nil;
        }
    }];
    
}

+ (void)showLaunchView
{
    if(!window_){
        launchViewController_ = [[CHBLaunchViewController alloc]init];
        window_ = [[UIWindow alloc] init];
        window_.frame = [UIScreen mainScreen].bounds;
        window_.windowLevel = UIWindowLevelAlert;
        window_.hidden = NO;
        window_.backgroundColor = [UIColor whiteColor];
        window_.rootViewController = launchViewController_;
        //        [window_ addSubview:launchViewController_.view];
    }
}

#pragma mark - 点击广告页
- (void)tapGesture:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"点击了广告页");
    [self closeView];
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
