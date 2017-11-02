//
//  UpLoadTaskVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/9.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "UpLoadTaskVC.h"
#import "UpLoadTaskTableCell.h"
#import "ShootVideoVC.h"

@interface UpLoadTaskVC ()<MyExerciseListCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *upLoadTableView;

@end

@implementation UpLoadTaskVC

#pragma mark - 事件处理
- (IBAction)goGackPage:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 视图加载
- (void)viewDidLoad
{
    [super viewDidLoad];
    [_upLoadTableView registerNib:[UINib nibWithNibName:@"UpLoadTaskTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"UpLoadTaskTableCell"];
}


#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UpLoadTaskTableCell * _cell = [tableView dequeueReusableCellWithIdentifier:@"UpLoadTaskTableCell" forIndexPath:indexPath];
    MyExerciseListModel *_model = [[MyExerciseListModel alloc] init];
    _cell.cellType = (int) (indexPath.section + indexPath.row);
    _cell.indexPath = indexPath;
    _cell.delegate = self;
    [_cell setValueByModel:_model];
    return _cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 129;
}

#pragma mark - MyExerciseListCellDelegate

- (void)submitMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"提交");
}

- (void)shotMyExerciseByIndex:(NSIndexPath *)indexPath
{
    ShootVideoVC *_shootVC = [[ShootVideoVC alloc] initWithNibName:@"ShootVideoVC" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:_shootVC animated:YES];
}

- (void)shareMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"分享");
}

- (void)recallMyExerciseByIndex:(NSIndexPath *)indexPath
{
    NSLog(@"撤回");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}

@end
