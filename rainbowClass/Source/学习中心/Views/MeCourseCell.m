//
//  MeCourseCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MeCourseCell.h"
#import "CHBMeCourseViewController.h"
#import "CHBXuexizhongxinViewController.h"
#import "MeCourseTableViewCell.h"
#import "AppointMentViewController.h"
#import "LSFNavigationController.h"
#import "SeeBeforeVedioVC.h"



@implementation MeCourseCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self reloadUI];
    }
    return self;
}



-(void)pushPage
{
    
    CHBMeCourseViewController * learnCenter = [[CHBMeCourseViewController alloc]init];
    CHBXuexizhongxinViewController * meCourseVC = (CHBXuexizhongxinViewController *)self.nextResponder.nextResponder.nextResponder.nextResponder;
    [meCourseVC.navigationController pushViewController:learnCenter animated:YES];


}
-(void)reloadUI

{
    
    
    self.titleImageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,CSCREEN_WIDTH, 46*CEqualSixScale)];
    _titleImageView.image = [UIImage imageNamed:@"学习中心2.png"];
    _titleImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_titleImageView];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushPage)];
    [self.titleImageView addGestureRecognizer:tapGesture];
    
    
    [self initLearnCenterTableView];
}




-(void)initLearnCenterTableView
{
    _liveCourseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,_titleImageView.bottom,CSCREEN_WIDTH,CSCREEN_HEIGHT -64*CEqualSixScale-46*CEqualSixScale) style:UITableViewStylePlain];
//    _liveCourseTableView.backgroundColor = [UIColor  grayColor];
    _liveCourseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _liveCourseTableView.delegate = self;
    _liveCourseTableView.dataSource = self;
    [self.contentView addSubview:_liveCourseTableView];
    
}






#pragma mark overide UITableViewDataSource methods

//tableView 中区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//每个区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
    
    
    
}



//创建cell并向cell中传值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *  CellIdentifier = @"inMeCell";
    MeCourseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MeCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                   reuseIdentifier:CellIdentifier];
    }
    
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 96*CEqualSixScale;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        CHBXuexizhongxinViewController * meCourseVC = (CHBXuexizhongxinViewController *)self.nextResponder.nextResponder.nextResponder.nextResponder;
    
    SeeBeforeVedioVC  * seeBeforeVC = [[SeeBeforeVedioVC alloc]init];
    [meCourseVC.navigationController presentViewController:seeBeforeVC animated:YES completion:nil];
    
    
//    
//    AppointMentViewController * appVC = [[AppointMentViewController alloc]init];
//    [meCourseVC.navigationController  presentViewController:appVC animated:YES completion:nil];
//    
//    
    
//    CHBTeacherHomePage *starVC = [[CHBTeacherHomePage alloc] init];
//    LSFNavigationController *nav = [[LSFNavigationController alloc] initWithRootViewController:appVC];
//    [meCourseVC.navigationController presentViewController:nav animated:YES completion:^
//     {
//         
//     }];
    
}


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    CHBMeCourseViewController * learnCenter = [[CHBMeCourseViewController alloc]init];
//    CHBXuexizhongxinViewController * meCourseVC = (CHBXuexizhongxinViewController *)self.nextResponder.nextResponder.nextResponder.nextResponder;
//    [meCourseVC.navigationController pushViewController:learnCenter animated:YES];
//    
//
//
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
