//
//  StudyMapViewController.m
//  Ofoimtage
//
//  Created by haoyunsong on 2017/10/9.
//  Copyright © 2017年 imitage. All rights reserved.
//

#import "StudyMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface StudyMapViewController ()

@end

@implementation StudyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [AMapServices sharedServices].enableHTTPS = YES;
    
    DLog(@"%f,%f",WIDTH,HEIGHT);
    
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    
    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
    r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    r.fillColor = [UIColor redColor];///精度圈 填充颜色, 默认 kAccuracyCircleDefaultColor
    r.strokeColor = [UIColor blueColor];///精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
    r.lineWidth = 2;///精度圈 边线宽度，默认0
    //    r.enablePulseAnnimation = NO;///内部蓝色圆点是否使用律动效果, 默认YES
//        r.locationDotBgColor = [UIColor greenColor];///定位点背景色，不设置默认白色
//        r.locationDotFillColor = [UIColor grayColor];///定位点蓝色圆点颜色，不设置默认蓝色
    //     r.image = [UIImage imageNamed:@"你的图片"]; ///定位图标, 与蓝色原点互斥
    [_mapView updateUserLocationRepresentation:r];
    
    // Do any additional setup after loading the view.
    
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-100, WIDTH, 100)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:view];
    
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH-50)/2, 25, 50, 50)];
    [btn setTitle:@"ok" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor yellowColor]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

- (void)btnAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
