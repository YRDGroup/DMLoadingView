//
//  UILabel+DMLineSpaceAndWordSpace.h
//  DMLoadingViewDemo
//
//  Created by 李二狗 on 2017/7/18.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DMLineSpaceAndWordSpace)

/**
 *  改变行间距
 */
- (void)dm_changeLineWithSpace:(float)space;

/**
 *  改变字间距
 */
- (void)dm_changeWordWithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (void)dm_changeSpacewithLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
