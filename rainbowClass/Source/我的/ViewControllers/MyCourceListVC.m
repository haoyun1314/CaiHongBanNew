//
//  MyCourceListVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyCourceListVC.h"
#import "PublicCourceDetailCell.h"
#import "UpLoadTaskVC.h"

@interface MyCourceListVC ()<PublicCourceDetailCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyCourceListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tableView registerNib:[UINib nibWithNibName:@"PublicCourceDetailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PublicCourceDetailCell"];
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
