//
//  DMLoadingView.m
//  DMLoadingViewDemo
//
//  Created by 李二狗 on 2017/7/18.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "DMLoadingView.h"
#import <objc/runtime.h>
#import "UILabel+DMLineSpaceAndWordSpace.h"

#define kLoadingViewScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kLoadingViewScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface DMLoadingView ()

//loading

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivityIndicatorView;

@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

//result

@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (copy, nonatomic) DMLoadingViewButtonPressedBlock buttonPressedBlock;


@end

@implementation DMLoadingView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self =  [[[NSBundle mainBundle] loadNibNamed:@"DMLoadingView" owner:self options:nil] firstObject];
        self.frame = frame;
    }
    return self;
}

- (IBAction)refreshButtonPressed:(id)sender {
    if (_buttonPressedBlock) {
        _buttonPressedBlock(sender);
    }
}


#pragma mark- 正在加载时

+ (void)showLoadingWithSuperView:(UIView *)superView
{
    [DMLoadingView loadingWithTitle:nil superView:superView];
}

+ (void)loadingWithTitle:(NSString *)title superView:(UIView *)superView
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:nil maskType:kDMLoadingViewTypeLoading superView:superView pressedBlock:nil];
}


#pragma mark- 无网络时链接

+ (void)showNoNetWorkWithSuperView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:nil buttonTitle:nil imageString:nil maskType:kDMLoadingViewTypeNoNetWorkAndRefresh superView:superView pressedBlock:buttonBlock];
}

+ (void)showNoNetWorkWithTitle:(NSString *)title superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:nil maskType:kDMLoadingViewTypeNoNetWorkAndRefresh superView:superView pressedBlock:buttonBlock];
}

+ (void)showNoNetWorkWithTitle:(NSString *)title imageString:(NSString *)imageString  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:imageString maskType:kDMLoadingViewTypeNoNetWorkAndRefresh superView:superView pressedBlock:buttonBlock];
}

//
+ (void)showNoNetWorkWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:buttonTitle imageString:nil maskType:kDMLoadingViewTypeNoNetWorkAndRefresh superView:superView pressedBlock:buttonBlock];
}



+ (void)showNoNetWorkWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle  imageString:(NSString *)imageString superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
     [DMLoadingView showWithTitle:title buttonTitle:buttonTitle imageString:imageString maskType:kDMLoadingViewTypeNoNetWorkAndRefresh superView:superView pressedBlock:buttonBlock];
}

#pragma mark- 加载失败结果展示

+ (void)showFailedWithTitle:(NSString *)title superView:(UIView *)superView
{
    [DMLoadingView showFailedWithTitle:title imageString:nil superView:superView];
}

+ (void)showFailedWithTitle:(NSString *)title imageString:(NSString *)imageString superView:(UIView *)superView
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:imageString maskType:kDMLoadingViewTypeFailed superView:superView pressedBlock:nil];
}


#pragma mark- 请求失败需要刷新时
/**
 请求失败需要刷新时
 default imageString
 
 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:buttonTitle imageString:nil maskType:kDMLoadingViewTypeFailedAndRefresh superView:superView pressedBlock:buttonBlock];
}

/**
 请求失败需要刷新时
 default buttonTitle
 
 @param title loading标题，可用\n换行，可以多行显示
 @param imageString 顶部图片
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title imageString:(NSString *)imageString  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:imageString maskType:kDMLoadingViewTypeFailedAndRefresh superView:superView pressedBlock:buttonBlock];
}

/**
 请求失败需要刷新时
 default buttonTitle 、imageString
 
 @param title loading标题，可用\n换行，可以多行显示
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:nil imageString:nil maskType:kDMLoadingViewTypeFailedAndRefresh superView:superView pressedBlock:buttonBlock];
}
/**
 请求失败时需要刷新的异常处理

 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param imageString 顶部图片
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle imageString:(NSString *)imageString superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    [DMLoadingView showWithTitle:title buttonTitle:buttonTitle imageString:imageString maskType:kDMLoadingViewTypeFailedAndRefresh superView:superView pressedBlock:buttonBlock];
}



/**
 loadingview初始化

 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param imageString 顶部图片
 @param type loadingview类型
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle imageString:(NSString *)imageString maskType:(kDMLoadingViewType)type  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock
{
    DMLoadingView *loadingView = [[DMLoadingView alloc]initWithFrame:superView.bounds];
    loadingView.buttonPressedBlock = buttonBlock;
    
    NSString *tempImageString = @"loadingViewDeveloperOut";
    if(imageString && imageString.length > 0){
        tempImageString = imageString;
    }
    
    NSString *tempButtonTitle = @"立即刷新";
    if(buttonTitle && buttonTitle.length > 0){
        tempButtonTitle = buttonTitle;
    }
    
    BOOL resultSign = YES;
    BOOL needRefreshSign = YES;
    switch (type) {
            case kDMLoadingViewTypeLoading:
        {
            if (!title && title.length <= 0) {
                title = @"正在加载...";
            }
            resultSign = NO;
            needRefreshSign = NO;
        }
            break;
            case kDMLoadingViewTypeFailed:
        {
            if (!title && title.length <= 0) {
                title = @"服务器异常，无数据返回";
            }
            resultSign = YES;
            needRefreshSign = NO;
            
        }
            break;
            case kDMLoadingViewTypeFailedAndRefresh:
        {
            if (!title && title.length <= 0) {
                title = @"服务器异常，无数据返回";
            }
            resultSign = YES;
            needRefreshSign = YES;
        }
            break;
            case kDMLoadingViewTypeNoNetWorkAndRefresh:
        {
            if (!title && title.length <= 0) {
                title = @"网络异常，请检查你的网络\n点击刷新";
            }
            resultSign = YES;
            needRefreshSign = YES;
        }
            
            break;
    }
    if (resultSign) {
        [loadingView.loadingActivityIndicatorView stopAnimating];
        loadingView.resultLabel.text = title;
        [loadingView.resultLabel dm_changeLineWithSpace:5];
        loadingView.resultImageView.image = [UIImage imageNamed:tempImageString];
    } else {
        [loadingView.loadingActivityIndicatorView startAnimating];
        loadingView.loadingLabel.text = title;
        [loadingView.loadingLabel dm_changeLineWithSpace:5];
    }
    
    loadingView.loadingActivityIndicatorView.hidden = resultSign;
    loadingView.loadingLabel.hidden = resultSign;
    
    loadingView.resultImageView.hidden = !resultSign;
    loadingView.resultLabel.hidden = !resultSign;
    loadingView.refreshButton.hidden = !needRefreshSign;
    [loadingView.refreshButton setTitle:tempButtonTitle forState:UIControlStateNormal];
    [superView addSubview:loadingView];
    
}

+ (void)dismissFromSuperView:(UIView *)superView
{
    for (UIView *subView in superView.subviews) {
        if ([subView isKindOfClass:[DMLoadingView class]]) {
            [superView removeFromSuperview];
        }
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
