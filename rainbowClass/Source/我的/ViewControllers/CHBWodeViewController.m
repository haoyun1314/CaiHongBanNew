//
//  CHBWodeViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBWodeViewController.h"
#import "CHBWodeListCell.h"
#import "MyStaticTextVC.h"
#import "MyExerciseVC.h"

@interface CHBWodeViewController ()


@property (weak, nonatomic) IBOutlet UITableView *tableView;

//顶部视图
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftArrow;
@property (weak, nonatomic) IBOutlet UIButton *personalButton;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;

//中部视图
@property (weak, nonatomic) IBOutlet UILabel *myExerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *myCourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *myBuyLabel;

//底部视图
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UIButton *logInBtn;

@property (nonatomic, assign) BOOL loginStatus;
@property (nonatomic, strong) NSArray *listArray;

@end

@implementation CHBWodeViewController

#pragma mark - 事件处理
//点击分享按钮
- (IBAction)shareAction:(id)sender {
    NSLog(@"分享");
}

//点击个人资料管理按钮
- (IBAction)clickDataManageAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"PersonalDataManageVC" sender:nil];
    }
}

//点击绑定学习码按钮
- (IBAction)clickBoundCodeAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"BoundCourseCodeVC" sender:nil];
    }
}

//点击我的习作按钮
- (IBAction)clickMyExerciseAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"MyExerciseVC" sender:nil];
    }
}

//点击我的课程按钮
- (IBAction)clickMyCourceAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"MyExerciseVC" sender:@"MyCource"];
    }
}

//点击我的购买按钮
- (IBAction)clickMyBuyAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"MyBuyVC" sender:nil];
    }
}

//点击收藏和观看按钮
- (IBAction)clickCollectAndWatchAction:(id)sender {
    if (_loginStatus) {
        [self performSegueWithIdentifier:@"CollectAndWatchVC" sender:nil];
    }
}

//点击注册按钮
- (IBAction)registerAction:(id)sender {
    NSLog(@"注册");
}

//点击退出登录按钮
- (IBAction)logoutAction:(id)sender {
    _loginStatus = NO;
    [self showLogOutState];
}

//点击登录按钮
- (IBAction)logInAction:(id)sender {
    _loginStatus = YES;
    [self showLogInState];
}

//登陆状态
- (void)showLogInState
{
    _registerBtn.hidden = YES;
    _logInBtn.hidden = YES;
    
    _logoutBtn.hidden = NO;
    
    _headImage.image = [UIImage imageNamed:@"headImage.png"];
    _nameLabel.text = @"张晓明★1.5万";
    _leftArrow.hidden = NO;
    _personalButton.hidden = NO;
    _rightArrow.hidden = NO;
    
    _balanceLabel.hidden = NO;
    _rechargeBtn.hidden = NO;
    
    _myExerciseLabel.text = @"我的习作(6366)";
    _myCourceLabel.text = @"我的课程(45)";
    _myBuyLabel.text = @"我的购买(10)";
}

//未登录状态
- (void)showLogOutState
{
    _registerBtn.hidden = NO;
    _logInBtn.hidden = NO;
    _logoutBtn.hidden = YES;
    _headImage.image = [UIImage imageNamed:@"未登录头像.png"];
    _nameLabel.text = @"尚未登陆";
    _leftArrow.hidden = YES;
    _personalButton.hidden = YES;
    _rightArrow.hidden = YES;
    _balanceLabel.hidden = YES;
    _rechargeBtn.hidden = YES;
    _myExerciseLabel.text = @"我的习作";
    _myCourceLabel.text = @"我的课程";
    _myBuyLabel.text = @"我的购买";
}



#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    
    _listArray = [NSArray arrayWithObjects:@"关于彩虹班", @"服务协议", @"隐私条款", @"清除缓存", @"常见问题", @"检查更新", @"意见反馈", nil];
    
    _loginStatus = YES;
    [self showLogInState];
}


#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHBWodeListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"CHBWodeListCell" forIndexPath:indexPath];
    if (_listArray.count > indexPath.row) {
        _cell.nameLabel.text = _listArray[indexPath.row];
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 3:
        {
            NSLog(@"%@", _listArray[indexPath.row]);
        }
            break;
        case 5:
        {
            NSLog(@"%@", _listArray[indexPath.row]);
        }
            break;
        case 6:
        {
            [self performSegueWithIdentifier:@"FeedbackVC" sender:indexPath];
        }
            break;
            
        default:
            [self performSegueWithIdentifier:@"MyStaticTextVC" sender:indexPath];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MyStaticTextVC"]) {
        NSIndexPath *_indexPath = (NSIndexPath *)sender;
        
        MyStaticTextVC *_textVC = segue.destinationViewController;
        _textVC.textContentType = (int)_indexPath.row;
        _textVC.titleString = _listArray[_indexPath.row];
    } else if ([segue.identifier isEqualToString:@"MyExerciseVC"]) {
        if (sender) {
            MyExerciseVC *_container = segue.destinationViewController;
            _container.isMyCourceContainer = YES;
        }
    }
}


@end
