//
//  MyExerciseListVC.m
//  rainbowClass
//
//  Created by WangYu on 25/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyExerciseListVC.h"
#import "MyExerciseListCell.h"
//#import "UpLoadTaskTableCell.h"

@interface MyExerciseListVC ()<MyExerciseListCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyExerciseListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [_tableView registerNib:[UINib nibWithNibName:@"UpLoadTaskTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"UpLoadTaskTableCell"];
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyExerciseListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"MyExerciseListCell" forIndexPath:indexPath];
    MyExerciseListModel *_model = [[MyExerciseListModel alloc] init];
    _cell.cellType = (int) (indexPath.section + indexPath.row);
    _cell.indexPath = indexPath;
    _cell.delegate = self;
    [_cell setValueByModel:_model];
    return _cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CScreenWidth, 35)];
    _headerView.backgroundColor = [Util hexStringToColor:@"f3f3f3"];
    
    UILabel *_sectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CScreenWidth - 20, 25)];
    _sectionTitle.textAlignment = NSTextAlignmentLeft;
    _sectionTitle.textColor = [Util hexStringToColor:@"64523f"];
    _sectionTitle.font = [UIFont systemFontOfSize:16];
    [_headerView addSubview:_sectionTitle];
    
    _sectionTitle.text = [NSString stringWithFormat:@"%ld 音乐基础第三课", 10 - section];
    
    return _headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", indexPath);
}

#pragma mark - MyExerciseListCellDelegate

- (void)submitMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"提交");
}

- (void)shotMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"拍摄");
}

- (void)shareMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"分享");
}

- (void)recallMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"撤回");
}

@end
