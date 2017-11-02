//
//  CHBMeCourseViewController.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBMeCourseViewController.h"
#import "HMSegmentedControl.h"
#import "MeCourseDetailFirstTableViewCell.h"

@interface CHBMeCourseViewController ()
{
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic,assign) CGFloat viewWidth;

@end

@implementation CHBMeCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;

    self.title = @"我的课程";
    self.edgesForExtendedLayout = UIRectEdgeNone;
     self.viewWidth = CGRectGetWidth(self.view.frame);
    
    self.view.backgroundColor = CWhiteColor;
    [self reloadSegmentController];
}

-(void)reloadSegmentController
{

    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 10, _viewWidth, 25)];
    self.segmentedControl.sectionTitles = @[@"幼儿中班音基课", @"幼儿钢琴高级版", @"幼儿唱歌冲击班"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = CWhiteColor;
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"000000"],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"70cbf2"]};
    self.segmentedControl.selectionIndicatorColor =[Util hexStringToColor:@"70cbf2"];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl.selectionIndicatorBoxOpacity = 0.01;
    self.segmentedControl.selectionIndicatorHeight = 1.0;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(weakSelf.viewWidth * index, 0, weakSelf.viewWidth, CSCREEN_HEIGHT-35) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
    
    [self reloadMeCourseUI:3];
    
 }


-(void)reloadMeCourseUI:(NSInteger)numPage
{


    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, _viewWidth, CSCREEN_HEIGHT-35)];
    self.scrollView.backgroundColor = CWhiteColor;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(_viewWidth * numPage, CSCREEN_HEIGHT-35);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(_viewWidth, 0, _viewWidth, CSCREEN_HEIGHT-35) animated:NO];
    [self.view addSubview:self.scrollView];
    
    
    
    
    
    for (NSInteger i = 0; i < numPage;i++)
    {
        UITableView * contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(_viewWidth*i, 19*CEqualSixScale,_viewWidth, CSCREEN_HEIGHT-35-19*CEqualSixScale) style:UITableViewStylePlain];
        contentTableView.backgroundColor = [Util hexStringToColor:@"6dd6fe"];
        contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        contentTableView.delegate = self;
        contentTableView.dataSource = self;
        [self.scrollView addSubview:contentTableView];
    }
    
}





#pragma mark overide UITableViewDataSource methods

//tableView 中区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}
//每个区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (section == 0)
    {
        
        return 9;
        
    }
    else
    {
    
        return 5;
    }
    
    
    
    
}



//创建cell并向cell中传值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *  CellIdentifier = @"FirstMeCourseTab";
        MeCourseDetailFirstTableViewCell * firstCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (firstCell == nil)
        {
            firstCell = [[MeCourseDetailFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                         reuseIdentifier:CellIdentifier];
        }
    
        firstCell.indexPath = indexPath;
        return firstCell;
}

//cell的自适应高度;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if (indexPath.row == 0 )
    {
        return  111*CEqualSixScale;
    }
    else
    {
    
        return 96*CEqualSixScale;

    }
    
}










- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
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
