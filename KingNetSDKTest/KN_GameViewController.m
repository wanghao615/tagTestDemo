//
//  GA_UsGameViewController.m
//  KingNetSDKTest
//
//  Created by niujf on 2019/3/6.
//  Copyright © 2019年 WHOwner All rights reserved.
//

#import "KN_GameViewController.h"
#import <MysticalPowerSDK/TMOpenShareSDK.h>
#import "IAPViewController.h"
@interface KN_GameViewController ()

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, strong) UIButton *hotstartBtn;
@property (nonatomic, strong) UIButton *hotendBtn;
@property (nonatomic, strong) UIButton *createroleBtn;
@property (nonatomic, strong) UIButton *roleloginBtn;
@property (nonatomic, strong) UIButton *LV2Btn;
@property (nonatomic, strong) UIButton *creashBtn;

@property (nonatomic, strong) UIButton *startguideBtn;
@property (nonatomic, strong) UIButton *endguideBtn;
@property (nonatomic, strong) UIButton *firstdiamondBtn;
@property (nonatomic, strong) UIButton *LV10Btn;
@property (nonatomic, strong) UIButton *LV15Btn;
@property (nonatomic, strong) UIButton *LV16Btn;
@property (nonatomic, strong) UIButton *LV17Btn;
@property (nonatomic, strong) UIButton *LV30Btn;
@property (nonatomic, strong) UIButton *LV31Btn;
@property (nonatomic, strong) UIButton *clearBtn;
@property (nonatomic, strong) UIButton *adBtn;
@property (nonatomic, strong) UIButton *AgreeMentBtn;

@end

@implementation KN_GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    

    
    [[TMOpenShareSDK shareTMOpenShareSDK] setLoginSuccessBlock:^(NSString *userName, NSString *userId, NSString *access_token) {
        NSLog(@"登录成功获取到的信息%@ %@ %@",userName,userId,access_token);
    }];
    

    [[TMOpenShareSDK shareTMOpenShareSDK] setLogOutSuccessBlock:^{
        NSLog(@"退出登录成功");
    }];
    
    //注意广告加载数据需要8～10s 游戏加载的时候 就可以初始化广告数据
    if (![TMOpenShareSDK shareTMOpenShareSDK].isReady) {
         [[TMOpenShareSDK shareTMOpenShareSDK]TS_requestRewardedVideoWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313" AdLoadStatus:^(NSError *LoadStatusBlock) {
               if (LoadStatusBlock) {
                   NSLog(@"视屏加载失败");
               }else{
                   NSLog(@"视屏加载成功");
               }
           }];
    }
    
//    [self loginBtnClicked];
    
    self.loginBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 350, 100, 50, 30);
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.payBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 350, 200, 50, 30);
        [btn setTitle:@"支付" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(payBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
        });
    self.startguideBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 20, 100, 30);
        [btn setTitle:@"开始新手引导" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(startguideBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.endguideBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 60, 100, 30);
        [btn setTitle:@"完成新手引导" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(endguideBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.firstdiamondBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 100, 150, 30);
        [btn setTitle:@"buyfirstgift_6" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(firstdiamondBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV10Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 140, 80, 30);
        [btn setTitle:@"LV10" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV10BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV15Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 180, 80, 30);
        [btn setTitle:@"LV15" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV15BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV16Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 220, 80, 30);
        [btn setTitle:@"LV16" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV16BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV17Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 270, 80, 30);
        [btn setTitle:@"LV17" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV17BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV30Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 310, 80, 30);
        [btn setTitle:@"LV30" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV30BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV31Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 150, 350, 80, 30);
        [btn setTitle:@"LV31" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV31BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.clearBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 350, 80, 30);
        [btn setTitle:@"清除缓存" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(clearBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.hotstartBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 30, 80, 30);
        [btn setTitle:@"热更开始" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(hotstartBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.hotendBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 80, 80, 30);
        [btn setTitle:@"热更结束" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(hotendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.createroleBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 130, 50, 30);
        [btn setTitle:@"VIP5" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(createroleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.roleloginBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 180, 80, 30);
        [btn setTitle:@"VIP6" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(roleloginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.LV2Btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 230, 50, 30);
        [btn setTitle:@"VIP7" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(LV2BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
    self.creashBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 280, 50, 30);
        [btn setTitle:@"崩溃" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(creashBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
//    self.adBtn = ({
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 450, 300, 150, 30);
//        [btn setTitle:@"激励视频" forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor lightGrayColor]];
//        [btn addTarget:self action:@selector(loadGoogleMobileAd:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        btn;
//    });
    
//    self.AgreeMentBtn = ({
//           UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//           btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 450, 150, 30);
//           [btn setTitle:@"订阅协议" forState:UIControlStateNormal];
//           [btn setBackgroundColor:[UIColor lightGrayColor]];
//           [btn addTarget:self action:@selector(showAgreement:) forControlEvents:UIControlEventTouchUpInside];
//           [self.view addSubview:btn];
//           btn;
//       });
}

- (void)loginBtnClicked{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_UserAutoLogin];
}

- (void)payBtnClicked{
    IAPViewController *vc = [[IAPViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)startguideBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"startguide" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)endguideBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"endguide" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)firstdiamondBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"buyfirstgift_6" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV10BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV10" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV15BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV15" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV16BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV16" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV17BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV17" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV30BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV30" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV31BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"LV31" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)clearBtnClicked:(UIButton *)btn{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"KN_Login_protocolStatus"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)hotstartBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"hotstart" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)hotendBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"hotend" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)createroleBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"VIP5" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)roleloginBtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"VIP6" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)LV2BtnClicked:(UIButton *)btn{
    [[TMOpenShareSDK shareTMOpenShareSDK] SG_CustomEvent:@"VIP7" roleid:@"123" roleName:@"金角大王" serverid:@"1"];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
}

- (void)creashBtnClicked:(UIButton *)btn{
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *arr = @[].mutableCopy;
        [arr removeObjectAtIndex:2];
    });
}

- (void)loadGoogleMobileAd:(UIButton *)sender{
    
    if (![TMOpenShareSDK shareTMOpenShareSDK].isReady) {
        [[TMOpenShareSDK shareTMOpenShareSDK]TS_requestRewardedVideoWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313" AdLoadStatus:^(NSError *LoadStatusBlock) {
            if (LoadStatusBlock) {
                NSLog(@"视屏加载失败");
            }else{
                NSLog(@"视屏加载成功");
                [self showMobileAd];
            }
        }];
        return;
    }
    [self showMobileAd];
}

- (void)showMobileAd{
    [[TMOpenShareSDK shareTMOpenShareSDK] TS_showRewardedVideoAdShowStatus:^(NSUInteger ShowStatusBlock, NSNumber *rewardAmount) {
            if (ShowStatusBlock==1) {
                NSLog(@"广告弹出成功");
            }else if (ShowStatusBlock==2){
                NSLog(@"已经获得奖励%f",rewardAmount.floatValue);
            }else if (ShowStatusBlock==3){
                NSLog(@"广告弹出失败");
                UIAlertController *alert =
                    [UIAlertController alertControllerWithTitle:@"Rewarded Ad Failed To Present"
                                                        message:@"The rewarded ad didn't present"
                                                 preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Drat"
                                                                      style:UIAlertActionStyleCancel
                                                                    handler:^(UIAlertAction *action) {
                                                                     [[TMOpenShareSDK shareTMOpenShareSDK]TS_requestRewardedVideoWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313" AdLoadStatus:^(NSError *LoadStatusBlock) {
                                                                          if (LoadStatusBlock) {
                                                                              NSLog(@"视屏加载失败");
                                                                          }else{
                                                                              NSLog(@"视屏加载成功");
                                                                          }
                                                                      }];
                                                                    }];
                [alert addAction:alertAction];
                [self presentViewController:alert animated:YES completion:nil];
            }else if (ShowStatusBlock==4){
                NSLog(@"广告消失");
                [[TMOpenShareSDK shareTMOpenShareSDK]TS_requestRewardedVideoWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313" AdLoadStatus:^(NSError *LoadStatusBlock) {
                    if (LoadStatusBlock) {
                        NSLog(@"视屏加载失败");
                    }else{
                        NSLog(@"视屏加载成功");
                    }
                }];
            }
        }];
        
    }


- (void)showAgreement:(UIButton *)sender{
     sender.selected = !sender.selected;
    if (sender.selected) {
        [[TMOpenShareSDK shareTMOpenShareSDK] displayPrivacyAndAutomaticRenewalAgreements:20001];
    }else{
        [[TMOpenShareSDK shareTMOpenShareSDK] displayPrivacyAndAutomaticRenewalAgreements:20002];
    }
    
}

@end
