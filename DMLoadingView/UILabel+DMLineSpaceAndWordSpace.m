//
//  UILabel+DMLineSpaceAndWordSpace.m
//  DMLoadingViewDemo
//
//  Created by 李二狗 on 2017/7/18.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "UILabel+DMLineSpaceAndWordSpace.h"

@implementation UILabel (DMLineSpaceAndWordSpace)

-(void)dm_changeLineWithSpace:(float)space{
    NSString *labelText = self.text;
    if (!labelText || labelText.length <= 0) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    paragraphStyle.alignment = self.textAlignment;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    
}

-(void)dm_changeWordWithSpace:(float)space{
    NSString *labelText = self.text;
    if (!labelText || labelText.length <= 0) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = self.textAlignment;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
}

-(void)dm_changeSpacewithLineSpace:(float)lineSpace WordSpace:(float)wordSpace{
    NSString *labelText = self.text;
    if (!labelText || labelText.length <= 0) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    paragraphStyle.alignment = self.textAlignment;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    
}

@end
