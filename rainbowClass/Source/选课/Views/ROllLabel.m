//
//  ROllLabel.m
//  RollLabel
//
//  Created by zhouxl on 12-11-2.
//  Copyright (c) 2012年 zhouxl. All rights reserved.
//


#import "ROllLabel.h"

#define KMODEAGAIN 1001
#define KMODEONLY  1002

@implementation ROllLabel

- (id)initWithFrame:(CGRect)frame withBgColor:(UIColor *)bgcolor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator   = NO;
        self.showsHorizontalScrollIndicator = NO;//水平滚动条
//        self.bounces = NO;
        self.backgroundColor = bgcolor;
        self.animationOption = -1;
    }
    return self;
}

//文字相继出现
- (void)rollLabelTitle:(NSString *)title textcolor:(UIColor *)color font:(UIFont *)font middleSpace:(NSUInteger) tempspace
{
    space = tempspace;
    //文字大小，设置label的大小和uiscroll的大小
    CGSize size = [title  sizeWithFont:font constrainedToSize:kConstrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    
    self.contentSize = size;//滚动大小
    
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    //初始化显示文字的label1
    UILabel *templb1 = [[UILabel alloc]initWithFrame:frame];
    self.label1 = templb1;
    [templb1 release], templb1 = nil;
    
    //初始化同时第二次出现的label2,在label1的右面，间隔为space
    UILabel *templb2 = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width+space, frame.origin.y, size.width, frame.size.height)];
    self.label2 = templb2;
    [templb2 release], templb2 = nil;
    
    //初始化同时第二次出现的label2,在label1的右面，间隔为space
    UILabel *templb3 = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width+space)*2, frame.origin.y, size.width, frame.size.height)];
    self.label3 = templb3;
    [templb3 release], templb3 = nil;
    
    //初始化同时第二次出现的label2,在label1的右面，间隔为space
    UILabel *templb4 = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width+space)*3, frame.origin.y, size.width, frame.size.height)];
    self.label4 = templb4;
    [templb4 release], templb4 = nil;
    
    //初始化同时第二次出现的label2,在label1的右面，间隔为space
    UILabel *templb5 = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width+space)*4, frame.origin.y, size.width, frame.size.height)];
    self.label5 = templb5;
    [templb5 release], templb5 = nil;
    
    self.label1.text = title,
    self.label2.text = title,
    self.label3.text = title,
    self.label4.text = title,
    self.label5.text = title,
    self.label1.font = font,
    self.label2.font = font,
    self.label3.font = font,
    self.label4.font = font,
    self.label5.font = font,
    self.label1.textColor = color,
    self.label2.textColor = color,
    self.label3.textColor = color,
    self.label4.textColor = color,
    self.label5.textColor = color,
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.label3];
    [self addSubview:self.label4];
    [self addSubview:self.label5];
    
    //保留最出的位置，以便后面恢复初始状态用
    self.frame1 = self.label1.frame;
    self.frame2 = self.label2.frame;
    self.frame3 = self.label3.frame;
    self.frame4 = self.label4.frame;
    self.frame5 = self.label5.frame;
    
    [self beginScrollWithTimeOfTimer:self.timeInterval withMode:KMODEAGAIN];
    self.mode = KMODEAGAIN;
}

-(void)beginScrollWithTimeOfTimer:(NSUInteger)timeInterval withMode:(NSUInteger)mode
{
    if (timeInterval < 8) {
        timeInterval = 8.0f;
        _timeInterval = 6;
    }
    NSTimer *timer;
    if (mode == KMODEAGAIN) {
        timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(animationOfScroll) userInfo:nil repeats:YES];
    }else if(mode == KMODEONLY){
        timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(animationOfScrollOnlyOne) userInfo:nil repeats:YES];
    }else{
        return;
    }
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
    self.timer = timer;
}

//滚动的动画，就是同时改变label1、label2的frame的x的值。
-(void)animationOfScroll
{
    CGPoint lb1Origin = self.label1.frame.origin;
    CGSize lb1Size = self.label1.frame.size;
    
    CGPoint lb2Origin = self.label2.frame.origin;
    CGSize lb2Size = self.label2.frame.size;
    
    CGPoint lb3Origin = self.label3.frame.origin;
    CGSize lb3Size = self.label3.frame.size;
    
    CGPoint lb4Origin = self.label4.frame.origin;
    CGSize lb4Size = self.label4.frame.size;
    
    CGPoint lb5Origin = self.label5.frame.origin;
    CGSize lb5Size = self.label5.frame.size;
    
    if (self.animationOption == -1) {
        self.animationOption = UIViewAnimationOptionCurveEaseInOut;
    }
    [UIView animateWithDuration:self.timeInterval-2.0 delay:0 options:self.animationOption animations:^{
        [self.label1 setFrame:CGRectMake(lb1Origin.x -  lb1Size.width - space, lb1Origin.y, lb1Size.width, lb1Size.height)];
        
        [self.label2 setFrame:CGRectMake(lb2Origin.x -  lb1Size.width - space, lb2Origin.y, lb2Size.width, lb2Size.height)];
        
        [self.label3 setFrame:CGRectMake(lb3Origin.x -  lb1Size.width - space, lb3Origin.y, lb3Size.width, lb3Size.height)];
        
        [self.label4 setFrame:CGRectMake(lb4Origin.x -  lb1Size.width - space, lb4Origin.y, lb4Size.width, lb4Size.height)];
        
        [self.label5 setFrame:CGRectMake(lb5Origin.x -  lb1Size.width - space, lb5Origin.y, lb5Size.width, lb5Size.height)];
        
    } completion:^(BOOL finished) {
        [self.label1 setFrame:self.frame1];
        [self.label2 setFrame:self.frame2];
        [self.label3 setFrame:self.frame3];
        [self.label4 setFrame:self.frame4];
        [self.label5 setFrame:self.frame5];
    }];
}


//滚动式文字只出现一次
- (void)rollOnlyOneTitle:(NSString *)title textcolor:(UIColor *)color font:(UIFont *)font
{

    //文字大小，设置label的大小和uiscroll的大小
    CGSize size = [title  sizeWithFont:font constrainedToSize:kConstrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    self.contentSize = size;//滚动大小
    
    RollFrame = self.frame;
    //初始化显示文字的label1
    UILabel *templb1 = [[UILabel alloc]initWithFrame:frame];
    self.label1 = templb1;
    [templb1 release], templb1 = nil;
    
    self.label1.text = title;
    self.label1.font = font;
    self.label1.textColor = color;
    self.label1.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.label1];
    
    //保留最出的位置，以便后面恢复初始状态用
    self.frame1 = self.label1.frame;
    
    [self beginScrollWithTimeOfTimer:self.timeInterval withMode:KMODEONLY];
    self.mode = KMODEONLY;
}

//滚动的动画，就是改变label1的frame的x的值。
-(void)animationOfScrollOnlyOne
{
    CGPoint lb1Origin = self.label1.frame.origin;
    CGSize lb1Size = self.label1.frame.size;
    
    if (self.animationOption == -1) {
        self.animationOption = UIViewAnimationOptionCurveEaseInOut;
    }
    [UIView animateWithDuration:self.timeInterval-0.1 delay:0 options:self.animationOption animations:^{
        if (lb1Origin.x == 0) {
            [self.label1 setFrame:CGRectMake(lb1Origin.x -  lb1Size.width, lb1Origin.y, lb1Size.width, lb1Size.height)];
        }else{
            [self.label1 setFrame:CGRectMake(lb1Origin.x -  lb1Size.width - RollFrame.size.width, lb1Origin.y, lb1Size.width, lb1Size.height)];
        }
     
        
    } completion:^(BOOL finished) {
        [self.label1 setFrame:CGRectMake(RollFrame.size.width, lb1Origin.y, lb1Size.width, lb1Size.height)];
    }];
}


-(void)pause
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }else{
        return;
    }
}

-(void)reStart
{
    if ([self.timer isValid]) {
        return;
    }
    [self beginScrollWithTimeOfTimer:self.timeInterval withMode:self.mode];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc
{
    [super dealloc];
    self.label1 = nil;
    self.label2 = nil;
    //timerArray = nil;
}

@end
