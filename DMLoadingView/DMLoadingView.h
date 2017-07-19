//
//  DMLoadingView.h
//  DMLoadingViewDemo
//
//  Created by 李二狗 on 2017/7/18.
//  Copyright © 2017年 YRHY Science and Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DMLoadingViewButtonPressedBlock)(UIButton *button);

typedef NS_ENUM(NSUInteger,kDMLoadingViewType) {
    kDMLoadingViewTypeLoading,             //刷新中
    kDMLoadingViewTypeFailed,              //默认  无刷新按钮
    kDMLoadingViewTypeFailedAndRefresh,    //需要刷新
    kDMLoadingViewTypeNoNetWorkAndRefresh  //无网络，刷新
};

@interface DMLoadingView : UIView



/**
 隐藏loadingview

 @param superView 父视图
 */
+ (void)dismissFromSuperView:(UIView *)superView;

/**
 展示加载中的loadingview

 @param superView 父视图
 */
+ (void)showLoadingWithSuperView:(UIView *)superView;
+ (void)loadingWithTitle:(NSString *)title superView:(UIView *)superView;

+ (void)showNoNetWorkWithSuperView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
+ (void)showNoNetWorkWithTitle:(NSString *)title superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
+ (void)showNoNetWorkWithTitle:(NSString *)title imageString:(NSString *)imageString  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
+ (void)showNoNetWorkWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
+ (void)showNoNetWorkWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle  imageString:(NSString *)imageString superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;

+ (void)showFailedWithTitle:(NSString *)title superView:(UIView *)superView;
+ (void)showFailedWithTitle:(NSString *)title imageString:(NSString *)imageString superView:(UIView *)superView;

/**
 请求失败需要刷新时
 default imageString
 
 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
/**
 请求失败需要刷新时
 default buttonTitle
 
 @param title loading标题，可用\n换行，可以多行显示
 @param imageString 顶部图片
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title imageString:(NSString *)imageString  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
/**
 请求失败需要刷新时
 default buttonTitle 、imageString
 
 @param title loading标题，可用\n换行，可以多行显示
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
/**
 请求失败时需要刷新的异常处理
 
 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param imageString 顶部图片
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showFailedAndRefreshWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle imageString:(NSString *)imageString superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;
/**
 loadingview初始化
 
 @param title loading标题，可用\n换行，可以多行显示
 @param buttonTitle 如果存在button，button的标题
 @param imageString 顶部图片
 @param type loadingview类型
 @param superView 父视图
 @param buttonBlock button的点击回调
 */
+ (void)showWithTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle imageString:(NSString *)imageString maskType:(kDMLoadingViewType)type  superView:(UIView *)superView pressedBlock:(DMLoadingViewButtonPressedBlock)buttonBlock;




@end
