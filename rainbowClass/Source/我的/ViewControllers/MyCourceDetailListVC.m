//
//  MyCourceDetailListVC.m
//  rainbowClass
//
//  Created by WangYu on 25/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyCourceDetailListVC.h"
#import "PublicCourceDetailCell.h"
#import "SeeBeforeVedioVC.h"
#import "UpLoadTaskVC.h"

@interface MyCourceDetailListVC ()<PublicCourceDetailCellDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation MyCourceDetailListVC

#pragma mark - 事件处理

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 视图加载

- (void)viewDidLoad
{
    [super viewDidLoad];
    _titleLabel.text = _courceName;
    [_tableView registerNib:[UINib nibWithNibName:@"PublicCourceDetailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PublicCourceDetailCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCourceDetailCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCourceDetailCell" forIndexPath:indexPath];
    MyCourceDetailListModel *_model = [[MyCourceDetailListModel alloc] init];
    _cell.type = (int) (indexPath.section + indexPath.row);
    _cell.indexPath = indexPath;
    _cell.delegate = self;
    [_cell setValueByModel:_model];
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@", indexPath);
//    SeeBeforeVedioVC * seeBeforeVC = [[SeeBeforeVedioVC alloc]init];
//    [self.navigationController presentViewController:seeBeforeVC animated:YES completion:nil];
    switch (indexPath.row) {
        case CourceListCellLive:
        {
            NSLog(@"正在直播");
        }
            break;
        case CourceListCellToLive:
        {
            NSLog(@"即将直播");
        }
            break;
        case CourceListCellUpload:
        {
            NSLog(@"回看");
        }
            break;
        case CourceListCellComment:
        {
            NSLog(@"回看");
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - MyCourceDetailLi stDelegate
//上传习作
- (void)uploadMyCourceByIndexPath:(NSIndexPath *)indexPath
{
    UpLoadTaskVC * uploadVC = [[UpLoadTaskVC alloc]init];
    [self.navigationController pushViewController:uploadVC animated:YES];
    
    NSLog(@"上传习作");
}
//观看点评
- (void)commentMyCourceByIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"观看点评");
}
//分享
- (void)shareMyCourceByIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"分享");
}

@end
