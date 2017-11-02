//
//  CHBSearchViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/1.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBSearchViewController.h"
#import "HMSegmentedControl.h"
#import "searchViewCell.h"

@interface CHBSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating,UITextFieldDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic,strong)UITextField *textField; // 搜索的textFild
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIView *coverView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *yunduoImg; //云朵
@property (nonatomic,strong) UITableView *tableView;


@end

@implementation CHBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [Util hexStringToColor:@"f3f3f3"];
    
    [self initNav];                 //初始化导航
    
    [self createSegmentedControl];  //创建SegmentedControl
    
    [self createTableView];         //创建TableView

}

#pragma mark - 添加搜索的view
- (void)initNav{
    // 导航
    UIView *navView = [VBase UIViewWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, 64) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:CMAIN_Color AndSuperView:self.view];
    // leftBtn 返回
    UIButton *backBtn = [VBase UIButtonWithFrame:CGRectMake(0, 20, 44, 44) AndBackgroundImageName:nil AndTitle:@"" AndTitleColor:nil AndSuperView:navView];
    [backBtn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    // 搜索框
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(backBtn.right, 28.5f, CSCREEN_WIDTH - backBtn.right * 2 , 27.0f)];
    [_textField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    _textField.placeholder = @"输入你想搜的课程、老师"; //默认显示的字
    
//    [_textField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"]; //placeholder 字体大小
    _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//自动大写输入
    _textField.returnKeyType = UIReturnKeyDone; //键盘类型
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    _textField.returnKeyType = UIReturnKeyGoogle; //return 为搜索
    _textField.delegate = self;
    UIImage *img = [UIImage imageNamed:@"搜索默认_03"];
    UIImageView *sousuoImg = [[UIImageView alloc]initWithFrame:CGRectMake(9, 0, img.size.width , img.size.height)];
    sousuoImg.image = img;
    _textField.leftView = sousuoImg;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_textField];
    // rightBtn 搜索
    UIButton *rightBtn = [VBase UIButtonWithFrame:CGRectMake(_textField.right, 20, 44, 44) AndBackgroundImageName:nil AndTitle:@"搜索" AndTitleColor:[UIColor whiteColor] AndSuperView:navView];
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(goSearch) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - 创建SegmentedControl
- (void)createSegmentedControl {
    
    UIView *titleView = [VBase UIViewWithFrame:CGRectMake(0, 64, CSCREEN_WIDTH, 44 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[Util hexStringToColor:@"6ecaf4"] AndSuperView:self.view];
    // 云朵
    _yunduoImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 74 * CEqualSixScale, 39 * CEqualSixScale)];
    _yunduoImg.image = [UIImage imageNamed:@"yunduo"];
    _yunduoImg.center = CGPointMake(CSCREEN_WIDTH/4 *3 + CSCREEN_WIDTH/4/2, 44/2 );
    [titleView addSubview:_yunduoImg];
//
    NSArray *titleArr = @[@"音乐大师",@"大师直播",@"大师课堂",@"精品课程"];
    for (int i = 0; i < titleArr.count; i++) {
        
    UIButton *btn = [VBase UIButtonWithFrame:CGRectMake(CSCREEN_WIDTH/4 * i, 7, CSCREEN_WIDTH/4, 44 * CEqualSixScale-7) AndBackgroundImageName:nil AndTitle:titleArr[i] AndTitleColor:[UIColor whiteColor] AndSuperView:titleView];
        btn.tag = 100+i;
        btn.titleLabel.font = [UIFont systemFontOfSize: 16.0 * CEqualSixScale];
        [btn addTarget:self action:@selector(segmentes:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 103){
            [btn setTitleColor:[Util hexStringToColor:@"ff6634"] forState:UIControlStateNormal];
        }
    }
    
    
//    _segmentedControl = [[HMSegmentedControl alloc]init];
//
//    _segmentedControl.frame = CGRectMake(0, 0, CSCREEN_WIDTH, 44 * CEqualSixScale);
////    _segmentedControl.sectionImages = @[[UIImage imageNamed:@"playVideo_本课知识原始"], [UIImage imageNamed:@"playVideo_课时列表原始"], [UIImage imageNamed:@"playVideo_老师介绍原始"]];
//    _segmentedControl.sectionTitles = @[@"音乐大师",@"大师直播",@"大师课堂",@"精品课程"];
//    _segmentedControl.sectionSelectedImages = @[[UIImage imageNamed:@"playVideo_本课知识点击"], [UIImage imageNamed:@"playVideo_课时列表点击"], [UIImage imageNamed:@"playVideo_老师介绍点击"]];
//    _segmentedControl.type = HMSegmentedControlTypeImages;
//    _segmentedControl.userInteractionEnabled = YES;
//    _segmentedControl.selectionIndicatorHeight = 0;
//    _segmentedControl.backgroundColor = [UIColor clearColor];
//    _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
//    _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
//    [_segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    [titleView addSubview:_segmentedControl];
//    
//    
//    self.segmentedControl.selectedSegmentIndex = 0;
//    self.segmentedControl.backgroundColor = [UIColor lightGrayColor];
//    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"64523f"],NSFontAttributeName:[UIFont systemFontOfSize:14]};
//    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"70cbf2"]};
//    self.segmentedControl.selectionIndicatorColor =[Util hexStringToColor:@"70cbf2"];
//    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
//    self.segmentedControl.selectionIndicatorBoxOpacity = 0.01;
//    self.segmentedControl.selectionIndicatorHeight = 1.0;
//    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;

}

- (void)segmentes:(UIButton*)sender {
    NSLog(@"----sender.tag = %ld",sender.tag);
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

//要实现的Delegate方法,关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}
//可以在UITextField使用下面方法，按return键返回
- (void) textFieldDone:(id) sender
{
    [_textField resignFirstResponder];
}

- (void)goSearch {
    NSLog(@"搜索");
}

- (void)goback {
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createTableView {
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + 44 * CEqualSixScale , CSCREEN_WIDTH , CScreenHeight-44 *CEqualSixScale -64 )];
    _scrollView.contentSize = CGSizeMake(CSCREEN_WIDTH * 4, 64 + 44 * CEqualSixScale);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];

    for (int i = 0; i < 4; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH * i, 0, CSCREEN_WIDTH, self.scrollView.frame.size.height)];
        tableView.tag = 1000 + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1];
        [self.scrollView addSubview:tableView];
    }
    
    _coverView = [VBase UIViewWithFrame:CGRectMake(0, 64, CSCREEN_WIDTH, CScreenHeight - 64) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:nil AndSuperView:self.view];
    _coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _coverView.hidden = YES;
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [_coverView addGestureRecognizer:singleTap];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [_textField becomeFirstResponder];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [_textField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView==self.scrollView) {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [_segmentedControl setSelectedSegmentIndex:page animated:YES];
        
    }
    
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [_textField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    _coverView.hidden = NO;

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    _coverView.hidden = YES;
    
    return YES;
}
//隐藏搜索页面并退出键盘
-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    [_textField resignFirstResponder];
    _coverView.hidden = YES;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
     searchViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[searchViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.imgView.image = [UIImage imageNamed:@"0012.jpg"];
    cell.lblTitle.text = @"钢琴基本指法入门";
    cell.lblPrice.text = @"2000元";
    
    cell.imgView2.image = [UIImage imageNamed:@"0012.jpg"];
    cell.lblTitle2.text = @"钢琴基本指法入门";
    cell.lblPrice2.text = @"2000元";

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 143*CEqualSixScale;
}



@end
