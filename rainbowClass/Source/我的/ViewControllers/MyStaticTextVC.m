//
//  MyStaticTextVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyStaticTextVC.h"

static NSString *_aboutCHBText = @"    彩虹班是基于捕梦网交互视频平台的在线音乐教育产品。宗旨是利用国韵文化优质的音乐大师和音乐领域的教育资源，打造最优秀的音乐教育内容，为每一个热爱艺术的孩子提供接受大师教育的机会。\n    线上与线下结合，在线交互视频授课与线下巡演、巡讲、夏令营、大师课结合。主要目标群体是音乐素质教育群体，特别是4——15岁的小初学生。";

static NSString *_serviceAgreementText = @"";

static NSString *_privacyclauseText = @"";

static NSString *_commonProblemText = @"";

@interface MyStaticTextVC ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation MyStaticTextVC

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameLabel.text = _titleString;
    
    NSString *_contentStr = @"";
    
    switch (_textContentType) {
        case MyStaticTextAboutCHB:
        {
            _contentStr = _aboutCHBText;
        }
            break;
        case MyStaticTextServiceAgreement:
        {
            _contentStr = _serviceAgreementText;
        }
            break;
        case MyStaticTextPrivacyclause:
        {
            _contentStr = _privacyclauseText;
        }
            break;
        case MyStaticTextCommonProblem:
        {
            _contentStr = _commonProblemText;
        }
            break;
            
        default:
            break;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 11;// 字体的行间距
    
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[Util hexStringToColor:@"666666"]};
    _contentTextView.attributedText = [[NSAttributedString alloc] initWithString:_contentStr attributes:attributes];
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
