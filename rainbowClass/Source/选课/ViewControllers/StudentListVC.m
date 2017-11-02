//
//  StudentListVC.m
//  rainbowClass
//
//  Created by WangYu on 29/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "StudentListVC.h"
#import "StudentListCell.h"
#import "PersonalHomePageVC.h"

@interface StudentListVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StudentListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"彩虹音乐榜";
    [_tableView registerNib:[UINib nibWithNibName:@"StudentListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"StudentListCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"StudentListCell" forIndexPath:indexPath];
    
    _cell.numberLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *_centerStoryboard = [UIStoryboard storyboardWithName:@"PersonalCenterStoryboard" bundle:[NSBundle mainBundle]];
    
    PersonalHomepageVC *_personalVC = [_centerStoryboard instantiateViewControllerWithIdentifier:@"PersonalHomepageVC"];
    [self.navigationController pushViewController:_personalVC animated:YES];
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
