//
//  PersonalDataManageVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "PersonalDataManageVC.h"
#import "PersonalDataListCell.h"

@interface PersonalDataManageVC ()

@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation PersonalDataManageVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _listArray = @[@"昵称",@"性别",@"出生日期",@"修改手机号码"];
    _imageArray = @[@"资料管理昵称",@"资料管理性别",@"资料管理日期",@"资料管理手机"];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalDataListCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalDataListCell" forIndexPath:indexPath];
    if (_listArray.count > indexPath.row) {
        _cell.nameLabel.text = _listArray[indexPath.row];
        NSString *_content = @"";
//        switch (indexPath.row) {
//            case 0:
//                _content = @"霎时烟花";
//                break;
//            case 1:
//                _content = @"男";
//                break;
//            case 2:
//                _content = @"1995年4月5日";
//                break;
//                
//            default:
//                break;
//        }
        _cell.contentLabel.text = _content;
        _cell.banner.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    }
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            NSLog(@"修改昵称");
            break;
        case 1:
            NSLog(@"修改性别");
            break;
        case 2:
            NSLog(@"修改出生日期");
            break;
        case 3:
            [self performSegueWithIdentifier:@"ChangePhoneNumberVC" sender:nil];
            break;
        default:
            
            break;
    }
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
