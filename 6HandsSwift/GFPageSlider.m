//
//  GFPageSlider.m
//  GFPageSlider
//
//  Created by Mercy on 15/6/30.
//  Copyright (c) 2015年 Mercy. All rights reserved.
//

#import "GFPageSlider.h"


@interface GFPageSlider() <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *menuScrollView;
@property (strong, nonatomic) UIScrollView *contentScrollView;
@property (strong, nonatomic) UIView *partitionLine;
@property (strong, nonatomic) UIView *indicatorLine;
@property (strong, nonatomic) UIButton *formerButton;
@property (nonatomic) int pageCount;
@property (nonatomic) NSInteger currentPage;

@end

#define kSelfViewWidth self.frame.size.width
#define kSelfViewHeight self.frame.size.height

static const CGFloat kIndicatorLineHeight = 3.0f;
static const CGFloat kPartitionLineHeight = 0.3f;


@implementation GFPageSlider


#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
                 numberOfPage:(int)pageCount
              viewControllers:(NSMutableArray *)viewControllers
             menuButtonTitles:(NSArray *)titles {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.pageCount = pageCount;
        self.currentPage = 0;
        
        self.menuHeight = 35.0f;
        self.menuNumberPerPage = 2;
        self.indicatorLineColor = [UIColor redColor];
        
        [self initMenuScrollView];
        [self initMenuButtons];
        [self initPartitionLine];
        [self initIndicatorLine];
        [self initContentScrollView];
        
        [self setupViewControllors:viewControllers];

        if (titles) {
            [self setTitles:titles];
        }
    }
    
    return self;
}


- (void)initMenuScrollView {
    self.menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kSelfViewWidth, self.menuHeight)];
    self.menuScrollView.contentSize = CGSizeMake(kSelfViewWidth / self.menuNumberPerPage * self.pageCount, self.menuHeight);
    UIColor *pageSliderMenuColor = [UIColor colorWithRed:243.f green:243.f blue:244.f alpha:1.f];
    self.menuScrollView.backgroundColor = pageSliderMenuColor;
    self.menuScrollView.bounces = NO;
    self.menuScrollView.alwaysBounceHorizontal = YES;
    self.menuScrollView.showsHorizontalScrollIndicator = NO;
    self.menuScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.menuScrollView];
}

- (void)initMenuButtons {
    for (int i = 0; i < self.pageCount; ++ i) {
        UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(i * (kSelfViewWidth / self.menuNumberPerPage), 0, kSelfViewWidth / self.menuNumberPerPage, self.menuHeight - kIndicatorLineHeight)];
        [self setupButton:menuButton withTag:(i + 1000) withText:[NSString stringWithFormat:@"第%d页",i + 1]];
        
        if (i == 0) {
            [menuButton setTitleColor:self.indicatorLineColor forState:UIControlStateNormal];
            self.formerButton = menuButton;
        }
    }
}

- (void)initPartitionLine {
    self.partitionLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.menuHeight - kPartitionLineHeight, kSelfViewWidth / self.menuNumberPerPage * self.pageCount, kPartitionLineHeight)];
    self.partitionLine.backgroundColor = [UIColor colorWithRed:218.0f / 255.0 green:218.0f / 255.0 blue:218.0f / 255.0 alpha:1];
    [self.menuScrollView addSubview:self.partitionLine];
}

- (void)initIndicatorLine {
    self.indicatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.menuHeight - kIndicatorLineHeight, kSelfViewWidth / self.menuNumberPerPage, kIndicatorLineHeight)];
    self.indicatorLine.backgroundColor = self.indicatorLineColor;
    [self.menuScrollView addSubview:self.indicatorLine];
}

- (void)initContentScrollView {
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.menuHeight, kSelfViewWidth, kSelfViewHeight - self.menuHeight)];
    self.contentScrollView.delegate = self;
    self.contentScrollView.contentSize = CGSizeMake(self.pageCount * kSelfViewWidth, kSelfViewHeight - self.menuHeight);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.bounces = NO;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.contentScrollView];
}


- (void)setupButton:(UIButton *)menuButton withTag:(int)tag withText:(NSString *)text {
    menuButton.tag = tag;
    [menuButton setTitle:text forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuScrollView addSubview:menuButton];
}


#pragma mark - Settings

- (void)setMenuHeight:(CGFloat)menuHeight {
    _menuHeight = menuHeight;
    
    self.menuScrollView.frame = CGRectMake(0, 0, kSelfViewWidth, self.menuHeight);
    self.menuScrollView.contentSize = CGSizeMake(kSelfViewWidth / self.menuNumberPerPage * self.pageCount, self.menuHeight);
    self.partitionLine.frame = CGRectMake(0, self.menuHeight - kPartitionLineHeight, kSelfViewWidth / self.menuNumberPerPage * self.pageCount, kPartitionLineHeight);
    self.indicatorLine.frame = CGRectMake(0, self.menuHeight - kIndicatorLineHeight, kSelfViewWidth / self.menuNumberPerPage, kIndicatorLineHeight);
    self.contentScrollView.frame = CGRectMake(0, self.menuHeight, kSelfViewWidth, kSelfViewHeight - self.menuHeight);
    self.contentScrollView.contentSize = CGSizeMake(self.pageCount * kSelfViewWidth, kSelfViewHeight - self.menuHeight);
    for (int i = 0; i < self.pageCount ; ++ i) {
        UIButton *button = (UIButton *)[self.menuScrollView viewWithTag:i + 1000];
        button.frame = CGRectMake(i * (kSelfViewWidth / self.menuNumberPerPage), 0, kSelfViewWidth / self.menuNumberPerPage, self.menuHeight - kIndicatorLineHeight);
    }
}

- (void)setMenuNumberPerPage:(int)menuNumberPerPage {
    _menuNumberPerPage = menuNumberPerPage;
    
    self.menuScrollView.contentSize = CGSizeMake(kSelfViewWidth / self.menuNumberPerPage * self.pageCount, self.menuHeight);
    self.partitionLine.frame = CGRectMake(0, self.menuHeight - kPartitionLineHeight, kSelfViewWidth / self.menuNumberPerPage * self.pageCount, kPartitionLineHeight);
    self.indicatorLine.frame = CGRectMake(0, self.menuHeight - kIndicatorLineHeight, kSelfViewWidth / self.menuNumberPerPage, kIndicatorLineHeight);
    for (int i = 0; i < self.pageCount ; ++ i) {
        UIButton *button = (UIButton *)[self.menuScrollView viewWithTag:i + 1000];
        button.frame = CGRectMake(i * (kSelfViewWidth / self.menuNumberPerPage), 0, kSelfViewWidth / self.menuNumberPerPage, self.menuHeight - kIndicatorLineHeight);
    }
}

- (void)setIndicatorLineColor:(UIColor *)indicatorLineColor {
    _indicatorLineColor = indicatorLineColor;
    
    self.indicatorLine.backgroundColor = indicatorLineColor;
    [self.formerButton setTitleColor:self.indicatorLineColor forState:UIControlStateNormal];
}

- (void)setTitles:(NSArray *)titles {
    for (int i = 0; i < self.pageCount ; ++ i) {
        UIButton *button = (UIButton *)[self.menuScrollView viewWithTag:i + 1000];
        [button setTitle:[titles objectAtIndex:i ] forState:UIControlStateNormal];
    }
}

- (void)setupViewControllors:(NSMutableArray *)viewControllers {
    for (int i = 0; i < self.pageCount; ++ i) {
        UIViewController *vc = (UIViewController *)[viewControllers objectAtIndex:i];
        if ([vc isKindOfClass:[UIViewController class]]) {

            vc.view.frame = CGRectMake(i * kSelfViewWidth, 0, kSelfViewWidth, self.contentScrollView.frame.size.height);
            [self.contentScrollView addSubview:vc.view];
        }
    }
    
}



#pragma mark - Actions

- (void)clickMenuButton:(UIButton *)menuButton {
    [self moveIndicatorWithButton:menuButton];
    [self changePageWithSelectedButton:menuButton];
}

- (void)moveIndicatorWithButton:(UIButton *)menuButton {
    [UIView beginAnimations:nil context:nil];
    
    if (self.pageCount > self.menuNumberPerPage) {
        
        
        if (menuButton.tag >= 1001 && menuButton.tag <= (1001 + (self.pageCount - self.menuNumberPerPage)) ) {
            [self.menuScrollView setContentOffset:CGPointMake((menuButton.tag - 1001) * (kSelfViewWidth / self.menuNumberPerPage), 0) animated:YES];
        }  else if (menuButton.tag > (1001 + (self.pageCount - self.menuNumberPerPage))) {
            [self.menuScrollView setContentOffset:CGPointMake((self.pageCount - self.menuNumberPerPage) * (kSelfViewWidth / self.menuNumberPerPage), 0) animated:YES];
        }
        
    }
    
    if([menuButton isKindOfClass:[UIButton class]]) {
        [self.formerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [menuButton setTitleColor:self.indicatorLineColor forState:UIControlStateNormal];
        [self.indicatorLine setFrame:CGRectMake(menuButton.frame.origin.x, self.menuHeight - kIndicatorLineHeight, kSelfViewWidth / self.menuNumberPerPage, kIndicatorLineHeight)];
    }
    
    [UIView commitAnimations];
    
    self.formerButton = menuButton;
}

- (void)changePageWithSelectedButton:(UIButton *)menuButton {
    self.currentPage = menuButton.tag - 1000;
    [self.contentScrollView setContentOffset:CGPointMake(self.currentPage * kSelfViewWidth, 0) animated:YES];
}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.contentScrollView.frame.size.width;

    self.currentPage = floor((self.contentScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    UIButton *menuButton = (UIButton *)[self.menuScrollView viewWithTag:self.currentPage + 1000];
    [self moveIndicatorWithButton:menuButton];
}

@end
