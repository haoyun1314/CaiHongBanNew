//
//  FamousTeacherListVC.m
//  rainbowClass
//
//  Created by WangYu on 29/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "FamousTeacherListVC.h"
#import "FamousTeacherListCell.h"
#import "CHBTeacherHomePage.h"

@interface FamousTeacherListVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *indexView;

@property (nonatomic, strong) NSMutableArray *indexArray;

@end

@implementation FamousTeacherListVC
#pragma mark - 事件处理

//点击索引
- (void)selectedIndexView:(UIButton *)button
{
    NSInteger section = button.tag - 600;
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"名师";
    
    [_tableView registerNib:[UINib nibWithNibName:@"FamousTeacherListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FamousTeacherListCell"];
    
    _indexArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    
    [self initIndexView];
    
}

- (void)initIndexView
{
    for (int i = 0; i < _indexArray.count; i++) {
        UIButton *_button = [[UIButton alloc] initWithFrame:CGRectMake(0, i * 14, 15, 14)];
        [_button setTitle:_indexArray[i] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:10];
        _button.tag = 600 + i;
        [_button addTarget:self action:@selector(selectedIndexView:) forControlEvents:UIControlEventTouchUpInside];
        [_indexView addSubview:_button];
    }
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _indexArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row == 3 && indexPath.section != _indexArray.count - 1) {
        return 83;
    }
    return 93;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FamousTeacherListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"FamousTeacherListCell" forIndexPath:indexPath];
    
    return _cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CScreenWidth, 30)];
    _headerView.backgroundColor = [Util hexStringToColor:@"f3f3f3"];
    
    UILabel *_label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 30, 30)];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.textColor = [UIColor blackColor];
    _label.font = [UIFont systemFontOfSize:17];
    
    _label.text = _indexArray[section];
    
    [_headerView addSubview:_label];
    
    return _headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHBTeacherHomePage * teacherVC = [[CHBTeacherHomePage alloc]init];
    [self.navigationController pushViewController:teacherVC animated:YES];
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
