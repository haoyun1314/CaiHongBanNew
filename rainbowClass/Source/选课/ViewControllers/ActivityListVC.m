//
//  ActivityListVC.m
//  rainbowClass
//
//  Created by WangYu on 29/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "ActivityListVC.h"
#import "ActivityListCell.h"
#import "ActivityDetailVC.h"

@interface ActivityListVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ActivityListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"活动";
    [_tableView registerNib:[UINib nibWithNibName:@"ActivityListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ActivityListCell"];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityListCell" forIndexPath:indexPath];
    
    _cell.activityName.text = @"活动一";
    _cell.bannerImage.image = [UIImage imageNamed:@"我的课程_01"];
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityDetailVC *_detailVC = [[ActivityDetailVC alloc] initWithNibName:@"ActivityDetailVC" bundle:[NSBundle mainBundle]];
    _detailVC.activityName = @"活动一";
    [self.navigationController pushViewController:_detailVC animated:YES];
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
