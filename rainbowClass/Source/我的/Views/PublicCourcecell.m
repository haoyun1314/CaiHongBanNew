//
//  PublicCourcecell.m
//  rainbowClass
//
//  Created by WangYu on 28/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "PublicCourcecell.h"

@implementation PublicCourcecell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)cancelCollectAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelCollectCourceByIndexPath:)]) {
        [self.delegate cancelCollectCourceByIndexPath:_indexPath];
    }
}

@end
