//
//  ViewController.m
//  VideoGame
//
//  Created by dgaf on 2017/6/21.
//  Copyright © 2017年 dgaf. All rights reserved.
//

#import "ViewController.h"
#import <PlayableAdsSDK/PlayableAds.h>
@interface ViewController ()<PlayableAdsDelegate>

@end

@implementation ViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:PlayableAdsReadyStateNotification object:nil];
}
- (void)updateReady:(NSNotification *)anotice{
    
    UIButton *a = [self.view viewWithTag:1228];
    [a setEnabled:[[anotice userInfo][@"isReady"] boolValue]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateReady:) name:PlayableAdsReadyStateNotification object:nil];
    
    UIButton *testbtn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    [testbtn1 setTitle:@"isReady" forState:UIControlStateNormal];
    [testbtn1 setTitle:@"notReady" forState:UIControlStateDisabled];
    [testbtn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [testbtn1 setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    [testbtn1 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:testbtn1];
    testbtn1.tag = 1228;
    [testbtn1 setEnabled:NO];
    
    
    UIButton *testbtn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [testbtn2 setTitle:@"播放" forState:UIControlStateNormal];
    [testbtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    testbtn2.tag = 100;
    [testbtn2 setBackgroundColor:[UIColor greenColor]];
    [testbtn2 addTarget:self action:@selector(enterGame:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testbtn2];
    
    
    UILabel *slabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 100, 28)];
    slabel.text = @"isDebug";
    slabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:slabel];
    UISwitch *switchView = [[UISwitch alloc]initWithFrame:CGRectMake(CGRectGetMaxX(slabel.frame), CGRectGetMinY(slabel.frame), 100.0f, 28.0f)];
    switchView.on = YES;
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: switchView];
    [switchView sendActionsForControlEvents:UIControlEventValueChanged];
    
}
- (void)switchAction:(id)sender{
    
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    
    [[NSUserDefaults standardUserDefaults] setObject:@(isButtonOn) forKey:@"TESTMODE"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)enterGame:(id)sender{
    [PlayableAds sharePlayableAds].delegate = self;
    
    if ([[PlayableAds sharePlayableAds] isReady]) {
        //资源已经准备好，直接加载播放
        [[PlayableAds sharePlayableAds] showPlayableAdsWith:@"" controller:self];
    }else{
        //手动加载资源
        [[PlayableAds sharePlayableAds] loadResources];
    }
}

#pragma mark - PlayableAdsDelegate

/**
 *加载成功
 */
- (void)loadSuccess{
    
    
}

/**
 *加载失败
 */
- (void)loadFailed:(NSDictionary *_Nullable)dic{
    
    
}

/**
 *广告打开
 */
- (void)playableAdsVideoDidOpen{
}

/**
 *广告点击
 */
- (void)playableAdsVideoDidCilck:(NSString *_Nullable)placeString{
}

/**
 *广告播放完成
 */
- (void)playableAdsVideoDidPlayComplete{
}

/**
 *广告关闭
 */
- (void)playableAdsVideoDidClose{
}

/**
 *准备发放奖励
 */
- (void)playableAdsVideoDidRewardUserWithReward:(NSDictionary *_Nullable)reward{
}

/**
 *不符合发放奖励
 */
- (void)playableAdsVideoDontReward:(NSError *_Nullable)error{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
