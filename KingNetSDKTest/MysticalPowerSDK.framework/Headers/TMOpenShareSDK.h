//
//  TMOpenShareSDK.h
//  KingNetSDK
//
//  Created by niujf on 2019/2/20.
//  Copyright © 2019年 WHOwner All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KNIAPModel;

typedef void(^IAPStatusBlock)(NSString *iapStatus);
typedef void(^AdLoadStatusBlock)(NSError *LoadStatusBlock);
typedef void(^AdShowStatusBlock)(NSUInteger ShowStatusBlock,NSNumber *rewardAmount);

@interface TMOpenShareSDK : NSObject

/*********************public****************/

+ (instancetype)shareTMOpenShareSDK;

- (void)SG_ProjectInit:(UIApplication *)application
           launchOptions:(NSDictionary *)launchOptions;

- (BOOL)SG_ThirdPartApplication:(UIApplication *)application
            openURL:(NSURL *)url
               options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

- (void)SG_AppsFlyerTrackerBecomeActive;

/*
 *  自动登录,没有账户数据进入正常登录界面
 */
- (void)SG_UserAutoLogin;

/*
 *  登录成功获取到一些信息
 */
@property (nonatomic, copy) void(^loginSuccessBlock)(NSString *userName,NSString *userId,NSString *access_token);


/**
 退出登录
 */
@property (nonatomic, copy) void(^logOutSuccessBlock)(void);

/*
 *  支付调取  iapStatus
 */
- (void)IAPWithModel:(KNIAPModel *)model
           IAPStatus:(IAPStatusBlock)iapStatus;

/**
 *  设置是否打印sdk的log信息, 默认NO(不打印log).
 */
- (void)setLogEnabled:(BOOL)isEnable;

#pragma mark - google mobile Ad --激励视频

- (void)TS_requestRewardedVideoWithAdUnitID:(NSString *)adUnitID AdLoadStatus:(AdLoadStatusBlock)loadStatus;

// 1:广告弹出显示 2: 已经获得奖励 3: 广告加载失败 5 广告结束 remove
- (void)TS_showRewardedVideoAdShowStatus:(AdShowStatusBlock)showStatus;

//广告资源是否准备 YES 已经准备 NO 没准备
- (BOOL)isReady;


#pragma mark - 展示订阅协议

-(void)displayPrivacyAndAutomaticRenewalAgreements:(NSUInteger)agreementsType;

#pragma mark - 数据统计

//- (void)SG_StaticsStart;
//
//- (void)SG_StaticsEnd;


/// 自定义事件，参数根据需求，没有传空nil/@""
/// @param event 事件名称
/// @param roleid 角色id
/// @param roleName 角色名称
/// @param serverid 区服id
- (void)SG_CustomEvent:(NSString *)event
               roleid:(NSString *)roleid
               roleName:(NSString *)roleName
              serverid:(NSString *)serverid;
/*********************private****************/

/*
 *  退出登录
 */
- (void)SG_UserExit;

/*
 *  退出登录界面
 */
- (void)SG_UserSignoutSdk;

/*
 *  悬浮球界面返回到游戏
 */
- (void)SG_UserStartToGame;

/*
 *  显示悬浮球
 */
- (void)SG_HoverballShow;

/*
 *  账号升级成功，改变点击悬浮球的展开content
 */
- (void)SG_HoverballShowStatus;

/*
 *  登录成功显示的title
 */
- (void)SG_LoginSuccessWithTitle:(NSString *)title;

/*
 *  判断log是打开
 */
- (BOOL)logEnable;

/**
 游客支付，升级弹框
 */
- (void)SG_AccountUpgradeSelectView;

/**
移除悬浮球
 */
- (void)SG_HoverballHidden;

/*
 *  用户的协议
 */
@property (nonatomic, strong) NSDictionary *dict;


/*
 *  支付的状态
 */
@property (nonatomic, copy) IAPStatusBlock block;

//支持的登录类型
@property (nonatomic ,strong) NSArray *supportLoginArr;


/// 初始化配置
@property (nonatomic ,strong) NSDictionary *customConfiguratorDict;

@end

/******************************内购模型********************/

//内购模型
@interface KNIAPModel: NSObject

@property(nonatomic,copy)NSString *appOrderID;
@property(nonatomic,copy)NSString *appUserID;
@property(nonatomic,copy)NSString *appUserName;
@property(nonatomic,copy)NSString *appUserServerID;
@property(nonatomic,copy)NSString *appUserServerName;
@property(nonatomic,copy)NSString *productId;
@property(nonatomic,copy)NSString *productName;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *app_extra1;
@property(nonatomic,copy)NSString *app_extra2;
@property(nonatomic,copy)NSString *callback_url;
@property(nonatomic,copy)NSString *purchase_type;
@end
