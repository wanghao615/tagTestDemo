//
//  IAPViewController.m
//  KingNetSDKTest
//
//  Created by niujf on 2019/3/11.
//  Copyright © 2019年 WHOwner All rights reserved.
//

#import "IAPViewController.h"
#import <MysticalPowerSDK/TMOpenShareSDK.h>


@interface IAPViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) NSArray *iapArr;
@property (nonatomic, strong) NSDictionary *priceDict;
@property (nonatomic,assign) BOOL firstName;

@end

@implementation IAPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView = ({
        UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds];
        tb.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//        tb.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50);
        tb.dataSource = self;
        tb.delegate = self;
        [self.view addSubview:tb];
        tb;
    });
    self.backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(450, 250, 100, 50);
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
}

- (void)akdjfaklakjsdj{
    NSLog(@"========");
}

- (void)backBtnClicked{
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.iapArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString *ID = @"IAPCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.iapArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pay:self.iapArr[indexPath.row] price:self.priceDict[self.iapArr[indexPath.row]]];
}

- (void)pay:(NSString *)productId price:(NSString *)price {
        KNIAPModel *model = [[KNIAPModel alloc]init];
        model.appOrderID = [NSString stringWithFormat:@"YYZZ%d",(int)[[NSDate date]timeIntervalSince1970]];
    if (_firstName) {
        model.appUserID = @"13229328200372159";
         _firstName = !_firstName;
    }else{
        model.appUserID = @"159962099506139002";
        _firstName = !_firstName;
    }
//        model.appUserID = @"13229328200372159";
        model.appUserName = @"허깨비벤드이";
        model.appUserServerID = @"1";
        model.appUserServerName = @"";
        model.productId = productId;
        model.productName = @"45 다이아 선물";
        model.price = price;
        model.app_extra1 = @"1|471012|E8DD5418-0265-4D4F-8195-072281A1ABA7|iPhone8,2"; //透传参数
        model.app_extra2 = @"0|CN_1.0.1_10010_201907191604_12.3.1_8_sc_ko"; //透传参数
        model.callback_url = @"1234567";
        model.purchase_type = @"1";//购买类型, 1: 常规购买；2：订阅购买
    if ([productId containsString:@"giftz1200"]) {
        model.purchase_type = @"2";
    }
        __weak typeof(self) weakSelf = self;
        [[TMOpenShareSDK shareTMOpenShareSDK] IAPWithModel:model IAPStatus:^(NSString *iapStatus) {
            if ([iapStatus isEqualToString:@"0"]) {//成功
                [weakSelf backBtnClicked];
            }else{//失败
                NSLog(@"=======%@",@"失败");
            };
        }];
}

- (NSArray *)iapArr{
    if (!_iapArr) {
        NSMutableArray *dArr = [NSMutableArray array];
        NSArray *priceArr =@[@"gift1200",@"gift2500",@"gift5900",@"gift12000",@"gift19000",@"gift25000",@"gift37000",@"gift65000",@"gift89000",@"gift119000",@"giftc19000",@"giftc12000",@"giftc5900",@"giftzs1200",@"giftzs5900",@"giftzs12000",@"giftzs25000",@"giftzs65000",@"giftzs119000",@"giftw1200"];
        for (int i = 0; i < priceArr.count; i ++) {
            NSString *str = [NSString stringWithFormat:@"%@%@",@"com.overseasgm.testnum.",priceArr[i]];
            [dArr addObject:str];
        }
        _iapArr = [dArr copy];
    }
    return _iapArr;
}

- (NSDictionary *)priceDict{
    if (!_priceDict) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSArray *priceArr = @[@"1200",@"2500",@"5900",@"12000",@"19000",@"25000",@"37000",@"65000",@"89000",@"119000",@"19000",@"12000",@"5900",@"1200",@"5900",@"12000",@"25000",@"65000",@"119000",@"1200"];
        __weak typeof(self) weakSelf = self;
        [priceArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [dict setObject:obj forKey:weakSelf.iapArr[idx]];
        }];
        _priceDict = [dict copy];
    }
    return _priceDict;
}
@end
