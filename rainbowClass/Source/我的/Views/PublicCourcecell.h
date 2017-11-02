//
//  PublicCourcecell.h
//  rainbowClass
//
//  Created by WangYu on 28/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PublicCourceDelegate <NSObject>

- (void)cancelCollectCourceByIndexPath:(NSIndexPath *)indexPath;

@end

@interface PublicCourcecell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *banner;
@property (weak, nonatomic) IBOutlet UIImageView *alreadyBuy;
@property (weak, nonatomic) IBOutlet UILabel *courceName;
@property (weak, nonatomic) IBOutlet UILabel *courcePrice;
@property (weak, nonatomic) IBOutlet UILabel *courceTeacher;
@property (weak, nonatomic) IBOutlet UIButton *cancelCollectBtn;

@property (nonatomic, assign) id<PublicCourceDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
