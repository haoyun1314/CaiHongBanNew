//
//  messagesViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBMessagesViewController.h"
#import "CHBSearchViewController.h"
#import "messageCell.h"

@interface CHBMessagesViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@end

@implementation CHBMessagesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initNav];           //初始化导航
    
    [self createTableView];   //创建tableView
    
}

- (void)initNav {
    
    self.title = @"消息";
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];//去掉导航底部黑线
    // 返回
    UIImage *leftImage = [UIImage imageNamed:@"goBack"];
    UIButton *leftBtn= [VBase UIButtonWithFrame:CGRectMake(0, 0, leftImage.size.width,leftImage.size.height) AndBackgroundImageName:@"goBack" AndTitle:nil AndTitleColor:nil AndSuperView:nil];
    [leftBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 搜索
    UIButton *rightBtn= [VBase UIButtonWithFrame:CGRectMake(0, 0, 32 * CEqualSixScale,44 * CEqualSixScale) AndBackgroundImageName:nil AndTitle:@"搜索" AndTitleColor:[UIColor whiteColor] AndSuperView:nil];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    [rightBtn addTarget:self action:@selector(goSearch) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
// 返回
- (void)goBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 搜索
- (void)goSearch {

    CHBSearchViewController *searchVC = [CHBSearchViewController new];
    
    [self.navigationController pushViewController:searchVC animated:YES];

}
// 创建tableView
- (void)createTableView {
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, CScreenHeight - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1];
    [self.view addSubview:_tableView];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"Cell";
    messageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[messageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
  
    cell.lblTitle.text = @"直播即将开始";
    cell.lblDate.text = @"12-12";
    cell.lblUploadTime.text = @"开课时间：12月17日17:00";
    cell.lblSubject.text = @"课名：4岁钢琴入门第一课";
    cell.lblTeacher.text = @"老师：贺冰新";
    cell.lblEnter.text = @"查看详情";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120 * CEqualSixScale;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
