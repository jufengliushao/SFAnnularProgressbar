//
//  ViewController.m
//  SFAnnularProgressbar
//
//  Created by cnlive-lsf on 2017/3/27.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "ViewController.h"
#import "SFAnnularBaseView.h"
@interface ViewController ()
@property (nonatomic, strong) SFAnnularBaseView *baseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.baseView);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
- (SFAnnularBaseView *)baseView{
    if (!_baseView) {
        _baseView = [[SFAnnularBaseView alloc] init];
        _baseView.frame = self.view.bounds;
        [self.view addSubview:_baseView];
    }
    return _baseView;
}
@end
