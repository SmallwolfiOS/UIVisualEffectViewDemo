//
//  ViewController.m
//  UIVisualEffectViewDemo
//
//  Created by baidu on 2018/7/27.
//  Copyright © 2018年 baidu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lauren.jpg"]];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
   
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    //设置虚化度
    effectView.alpha=0.5;
    effectView.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    [imageView addSubview:effectView];
    [self.view addSubview:imageView];
    
    
    
    
//    **************************************************************
    
//    UIVibrancyEffect的作用是放大和调整UIVisualEffectView内容视图的内容的颜色,让UIVisualEffectView的contentView中的内容看起来更加生动。它作为一个子视图被放置在UIVisualEffectView上面，去连接UIBlurEffect。这种效果只会影响添加到UIVisualEffectView的contentView上的内容。因为活力影响是受颜色依赖的.....    
//    我们可以看出：通常UIVibrancyEffect对象是与UIBlurEffect一起使用，主要用于处理在UIBlurEffect特效上的一些显示效果。
    
    
//    UIBlurEffectStyleProminent//更改此处可以更改文字颜色
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
    
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    UIVisualEffectView *vise = [[UIVisualEffectView alloc] initWithEffect:vibrancy];
    //设置虚化度
    vise.alpha=0.9;
    vise.frame=CGRectMake(0, 0, self.view.frame.size.width, 250);
    
    UIImageView * imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lauren.jpg"]];
    imageView2.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
    [imageView2 addSubview:vise];
    
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 21)];
    label.text  = @"这就是文字，用来查看效果";
    [label setTextColor:[UIColor redColor]];//textColor在这里失效
    
//    这也是特别要注意的地方，文档中也有专门提出，并给出了解释：Because the vibrancy effect is color dependent, subviews added to the contentView need to be tintColorDidChange aware and must be prepared to update themselves accordingly. 所以我们使用 label.textColor去改变颜色是完全不起作用的
    label.tintColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:17];
    [label setTextAlignment:NSTextAlignmentCenter];
    ///不要直接添加子视图去UIVisualEffectView，而是要添加到contentView上。
    [vise.contentView addSubview:label];
    [self.view addSubview:imageView2];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
