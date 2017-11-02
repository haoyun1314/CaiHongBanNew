

//-------------全局关键字------------
// 颜色值
// 主色
#define CMAIN_Color [[UIColor alloc]initWithRed:113/255.f green:213/255.f blue:254/255.f alpha:1]
// 字色
#define CTitle_Color [[UIColor alloc]initWithRed:101/255.f green:82/255.f blue:65/255.f alpha:1]
//深灰-字体
#define COLOR_GRAY_0 [[UIColor alloc]initWithRed:0x33/255.f green:0x33/255.f blue:0x33/255.f alpha:1]

// 字体值
typedef enum {
    CCWFontSize18 = 18, // 导航栏字体
    CCWFontSize16 = 16, // 内容标题字体
    CCWFontSize15 = 15, // 内容正文字体
    CCWFontSize14 = 14, // 聊天内容字体
    CCWFontSize13 = 13, // 说明介绍字体
    CCWFontSize12 = 12  // 分类介绍、辅助说明、次要信息字体
}CHBFontSize;

//获取系统版本
#define CIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CCurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define CIOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? (YES):(NO))

/*
 *屏幕宽度
 */
#define CSCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

/*
 *屏幕高度
 */
#define CSCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

/*
 *状态条高度
 */
#define CSTATUSBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)

#define BASE_RATE (CSCREEN_WIDTH/320)


#define CSCREEN_HEIGHT_OF_IPHONE4S       480
#define CSCREEN_HEIGHT_OF_IPHONE5        568
#define CSCREEN_HEIGHT_OF_IPHONE6        667
#define CSCREEN_HEIGHT_OF_IPHONE6PLUS    736

#define CSCREEN_BOUNDS               [UIScreen mainScreen].bounds
#define CIS4SInchScreen              (CSCREEN_HEIGHT == CSCREEN_HEIGHT_OF_IPHONE4S)
#define CIS4InchScreen               (CSCREEN_HEIGHT == CSCREEN_HEIGHT_OF_IPHONE5)
#define CISIPHONE6                   (CSCREEN_HEIGHT == CSCREEN_HEIGHT_OF_IPHONE6)
#define CISIPHONE6PLUS               (CSCREEN_HEIGHT == CSCREEN_HEIGHT_OF_IPHONE6PLUS)
#define CDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// 1.判断是否为iOS7
#define CiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 2.获得RGB颜色
#define CLSFColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//白色
#define CWhiteColor CLSFColor(255, 255, 255)
//黑丝
#define CBlackColor CLSFColor(37, 37, 37)
// 3.判断当前屏值大小
#define CScreenWidth [UIScreen mainScreen].bounds.size.width
#define CScreenHeight [UIScreen mainScreen].bounds.size.height
//4.按6的尺寸等比例缩放
#define CEqualSixScale CScreenWidth / 375
#define C4S  480/CSCREEN_HEIGHT_OF_IPHONE6














//导航标题key
#define NAV_TITLE               @"NAV_TITLE"
//tabbaritem项标题key
#define TABBAR_TITLE            @"TABBAR_TITLE"
//tabbaritem项图片名key
#define TABBAR_IMAGE            @"TABBAR_IMAGE"
//tabbaritem项选中图片名key
#define TABBAR_SELECTED_IMAGE   @"TABBAR_SELECTED_IMAGE"
//返回按钮图片名
#define Nav_BackItem_Image      @"wode_fanhui"

