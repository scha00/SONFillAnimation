//
//  SONViewController.m
//  SONFillAnimation
//
//  Created by Sahnghyun Cha on 13. 7. 9..
//  Copyright (c) 2013 Soncode(Sahn Cha). All rights reserved.
//

#import "SONViewController.h"
#import "SONFillAnimation.h"

#define RADIAN(x) x*M_PI/180.0f

@interface SONViewController () <UIScrollViewDelegate>

- (void)resetBoxesExcept:(NSInteger)viewNo;
- (void)disableScrolling;
- (void)enableScrolling;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *alertLabel;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *box1View;
@property (nonatomic, strong) UIView *box2View;
@property (nonatomic, strong) UIView *box3View;
@property (nonatomic, strong) UIView *box4View;
@property (nonatomic, strong) UIView *box5View;
@property (nonatomic, strong) UIView *box6View;
@property (nonatomic, strong) UIView *box7View;

@property (nonatomic, strong) SONFillAnimation *animation;
@property (nonatomic, strong) SONFillAnimation *customAnimation;

@end

@implementation SONViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int numberOfDemoSlides = 6;
    
    // Scroll view
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfDemoSlides, self.view.frame.size.height);
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    // Views
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 100;
    UIFont *boldFont = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:22];
    UIFont *lightFont = [UIFont fontWithName:@"AmericanTypewriter" size:14];
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, width, height)];
    mainView.backgroundColor = [UIColor colorWithRed:0/255.0 green:135/255.0 blue:130/255.0 alpha:1.0];
    [self.scrollView addSubview:mainView];
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    mainLabel.backgroundColor = [UIColor clearColor];
    mainLabel.font = boldFont;
    mainLabel.textColor = [UIColor whiteColor];
    mainLabel.textAlignment = NSTextAlignmentCenter;
    mainLabel.text = @"SONFillAnimation";
    [mainView addSubview:mainLabel];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, width, 50)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = lightFont;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"Sahn Cha.";
    [mainView addSubview:nameLabel];
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SoncodeIconWhite"]];
    iconImageView.center = CGPointMake(width / 2.0, height / 2.0);
    iconImageView.alpha = 0.0;
    [mainView addSubview:iconImageView];
    SONFillAnimation *iconAnimation = [[SONFillAnimation alloc] initWithNumberOfRows:3 columns:3 animationType:SONFillAnimationTypeDefault];
    iconAnimation.disableShadeAnimation = YES;
    [iconAnimation animateView:iconImageView delay:1.0 completion:^{}];
    
    UIView *demoLRView = [[UIView alloc] initWithFrame:CGRectMake(width, 50, width, height)];
    demoLRView.backgroundColor = [UIColor colorWithRed:83/255.0 green:135/255.0 blue:0/255.0 alpha:1.0];
    [self.scrollView addSubview:demoLRView];
    UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel1.backgroundColor = [UIColor clearColor];
    titleLabel1.font = boldFont;
    titleLabel1.textColor = [UIColor whiteColor];
    titleLabel1.textAlignment = NSTextAlignmentCenter;
    titleLabel1.text = @"Left to Right";
    [demoLRView addSubview:titleLabel1];
    UILabel *subLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, width, 50)];
    subLabel1.backgroundColor = [UIColor clearColor];
    subLabel1.font = lightFont;
    subLabel1.textColor = [UIColor whiteColor];
    subLabel1.textAlignment = NSTextAlignmentCenter;
    subLabel1.text = @"FoldOut";
    [demoLRView addSubview:subLabel1];
    
    UIView *demoRLView = [[UIView alloc] initWithFrame:CGRectMake(width * 2, 50, width, height)];
    demoRLView.backgroundColor = [UIColor colorWithRed:135/255.0 green:92/255.0 blue:0/255.0 alpha:1.0];
    [self.scrollView addSubview:demoRLView];
    UILabel *titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel2.backgroundColor = [UIColor clearColor];
    titleLabel2.font = boldFont;
    titleLabel2.textColor = [UIColor whiteColor];
    titleLabel2.textAlignment = NSTextAlignmentCenter;
    titleLabel2.text = @"Right to Left";
    [demoRLView addSubview:titleLabel2];
    UILabel *subLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, width, 50)];
    subLabel2.backgroundColor = [UIColor clearColor];
    subLabel2.font = lightFont;
    subLabel2.textColor = [UIColor whiteColor];
    subLabel2.textAlignment = NSTextAlignmentCenter;
    subLabel2.text = @"FoldIn";
    [demoRLView addSubview:subLabel2];
    
    UIView *demoRandomView = [[UIView alloc] initWithFrame:CGRectMake(width * 3, 50, width, height)];
    demoRandomView.backgroundColor = [UIColor colorWithRed:0/255.0 green:135/255.0 blue:67/255.0 alpha:1.0];
    [self.scrollView addSubview:demoRandomView];
    UILabel *titleLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel3.backgroundColor = [UIColor clearColor];
    titleLabel3.font = boldFont;
    titleLabel3.textColor = [UIColor whiteColor];
    titleLabel3.textAlignment = NSTextAlignmentCenter;
    titleLabel3.text = @"Random";
    [demoRandomView addSubview:titleLabel3];
    
    UIView *demoCustomView = [[UIView alloc] initWithFrame:CGRectMake(width * 4, 50, width, height)];
    demoCustomView.backgroundColor = [UIColor colorWithRed:50/255.0 green:90/255.0 blue:205/255.0 alpha:1.0];
    [self.scrollView addSubview:demoCustomView];
    UILabel *titleLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel4.backgroundColor = [UIColor clearColor];
    titleLabel4.font = boldFont;
    titleLabel4.textColor = [UIColor whiteColor];
    titleLabel4.textAlignment = NSTextAlignmentCenter;
    titleLabel4.text = @"Custom Animation";
    [demoCustomView addSubview:titleLabel4];
    
    UIView *demoEndView = [[UIView alloc] initWithFrame:CGRectMake(width * 5, 50, width, height)];
    demoEndView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:demoEndView];
    UIView *pageTintView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 40, width, 40)];
    pageTintView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [demoEndView addSubview:pageTintView];
    UILabel *titleLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel5.backgroundColor = [UIColor clearColor];
    titleLabel5.font = boldFont;
    titleLabel5.textColor = [UIColor colorWithRed:200/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    titleLabel5.textAlignment = NSTextAlignmentCenter;
    titleLabel5.text = @"Soncode.com";
    [demoEndView addSubview:titleLabel5];
    UILabel *endLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
    endLabel.center = CGPointMake(width / 2.0, height / 2.0);
    endLabel.backgroundColor = [UIColor clearColor];
    endLabel.font = lightFont;
    endLabel.numberOfLines = 0;
    endLabel.textColor = [UIColor colorWithRed:200/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    endLabel.textAlignment = NSTextAlignmentCenter;
    endLabel.text = @"SONFillAnimation v.1\nby Sahn Cha.\n\n Swipe back to restart demo slides.";
    [demoEndView addSubview:endLabel];
    
    // DEMO Box views
    self.box1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box1View.backgroundColor = [UIColor orangeColor];
    self.box1View.center = CGPointMake(width / 2.0, (height / 2.0) - 60);
    [demoLRView addSubview:self.box1View];
    
    self.box2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box2View.backgroundColor = [UIColor cyanColor];
    self.box2View.center = CGPointMake(width / 2.0, (height / 2.0) + 60);
    [demoLRView addSubview:self.box2View];
    
    self.box3View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box3View.backgroundColor = [UIColor orangeColor];
    self.box3View.center = CGPointMake(width / 2.0, (height / 2.0) - 60);
    [demoRLView addSubview:self.box3View];
    
    self.box4View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box4View.backgroundColor = [UIColor cyanColor];
    self.box4View.center = CGPointMake(width / 2.0, (height / 2.0) + 60);
    [demoRLView addSubview:self.box4View];
    
    self.box5View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box5View.backgroundColor = [UIColor orangeColor];
    self.box5View.center = CGPointMake(width / 2.0, (height / 2.0) - 60);
    [demoRandomView addSubview:self.box5View];
    
    self.box6View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.box6View.backgroundColor = [UIColor cyanColor];
    self.box6View.center = CGPointMake(width / 2.0, (height / 2.0) + 60);
    [demoRandomView addSubview:self.box6View];
    
    self.box7View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.box7View.backgroundColor = [UIColor orangeColor];
    self.box7View.center = CGPointMake(width / 2.0, (height / 2.0));
    [demoCustomView addSubview:self.box7View];
    
    // Page control
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = numberOfDemoSlides;
    self.pageControl.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height - 70);
    [self.view addSubview:self.pageControl];
    
    // Alert label
    self.alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    self.alertLabel.backgroundColor = [UIColor clearColor];
    self.alertLabel.textColor = [UIColor redColor];
    self.alertLabel.textAlignment = NSTextAlignmentCenter;
    self.alertLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    self.alertLabel.text = @"";
    [self.view addSubview:self.alertLabel];
    
    // SONFillAnimation
    self.animation = [[SONFillAnimation alloc] initWithNumberOfRows:4 columns:4 animationType:SONFillAnimationTypeDefault];
    self.customAnimation = [[SONFillAnimation alloc] initWithNumberOfRows:6 columns:6 animationType:SONFillAnimationTypeCustom];
    
    CABasicAnimation *tAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    tAnimation1.fromValue = [NSNumber numberWithFloat:0.5];
    tAnimation1.toValue = [NSNumber numberWithFloat:1.0];
    CABasicAnimation *tAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    tAnimation2.fromValue = [NSNumber numberWithFloat:RADIAN(45)];
    tAnimation2.toValue = [NSNumber numberWithFloat:RADIAN(0)];
    CABasicAnimation *tAnimation3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    tAnimation3.fromValue = [NSNumber numberWithFloat:0.0];
    tAnimation3.toValue = [NSNumber numberWithFloat:1.0];
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    [groupAnimation setAnimations:[NSArray arrayWithObjects:tAnimation1, tAnimation2, tAnimation3, nil]];
    self.customAnimation.transformAnimation = groupAnimation;
    self.customAnimation.duration = 0.3;
    self.customAnimation.xDelay = 0.15;
    self.customAnimation.yDelay = 0.15;
    
    [self resetBoxesExcept:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetBoxesExcept:(NSInteger)viewNo
{
    if (viewNo != 1) {
        self.box1View.alpha = 0.0;
        self.box2View.alpha = 0.0;
    }
    if (viewNo != 2) self.box3View.alpha = 1.0;
    if (viewNo != 2) self.box4View.alpha = 1.0;
    if (viewNo != 3) self.box5View.alpha = 0.0;
    if (viewNo != 3) self.box6View.alpha = 0.0;
    if (viewNo != 4) self.box7View.alpha = 0.0;
}

- (void)disableScrolling
{
    self.scrollView.scrollEnabled = NO;
    self.alertLabel.text = @"Wait / Animating";
}

- (void)enableScrolling
{
    self.scrollView.scrollEnabled = YES;
    self.alertLabel.text = @"";
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = floorf(scrollView.contentOffset.x / self.view.frame.size.width);
    
    if (self.pageControl.currentPage == 1) {
        [self resetBoxesExcept:1];
        [self disableScrolling];
        self.animation.animationType = SONFillAnimationTypeFoldOut;
        self.animation.direction = SONFillAnimationDirectionLeftToRightAndTopDown;
        self.animation.anchorPoint = CGPointMake(0.0, 0.5);
        [self.animation setRotationVector:0 :-1 :0];
        [self.animation animateView:self.box1View completion:^{}];
        self.animation.direction = SONFillAnimationDirectionLeftToRightAndBottomUp;
        [self.animation animateView:self.box2View completion:^{[self enableScrolling];}];
    } else if (self.pageControl.currentPage == 2) {
        [self resetBoxesExcept:2];
        [self disableScrolling];
        self.animation.animationType = SONFillAnimationTypeFoldIn;
        self.animation.direction = SONFillAnimationDirectionRightToLeftAndTopDown;
        self.animation.anchorPoint = CGPointMake(0.0, 0.5);
        [self.animation setRotationVector:0 :-1 :0];
        [self.animation animateView:self.box3View completion:^{}];
        self.animation.direction = SONFillAnimationDirectionRightToLeftAndBottomUp;
        [self.animation animateView:self.box4View completion:^{[self enableScrolling];}];
    } else if (self.pageControl.currentPage == 3) {
        [self resetBoxesExcept:3];
        [self disableScrolling];
        self.animation.animationType = SONFillAnimationTypeFoldOut;
        self.animation.direction = SONFillAnimationDirectionRandom;
        self.animation.anchorPoint = CGPointMake(0.5, 0.0);
        [self.animation setRotationVector:1 :0 :0];
        [self.animation animateView:self.box5View completion:^{}];
        [self.animation animateView:self.box6View completion:^{[self enableScrolling];}];
    } else if (self.pageControl.currentPage == 4) {
        [self resetBoxesExcept:4];
        [self disableScrolling];
        [self.customAnimation animateView:self.box7View completion:^{[self enableScrolling];}];
    } else {
        [self resetBoxesExcept:0];
    }
}

@end
