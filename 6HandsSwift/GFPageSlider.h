
#import <UIKit/UIKit.h>

@interface GFPageSlider : UIView

@property (nonatomic) CGFloat menuHeight;
@property (nonatomic) int menuNumberPerPage;
@property (nonatomic) UIColor *indicatorLineColor;



- (instancetype)initWithFrame:(CGRect)frame
                 numberOfPage:(int)pageCount
              viewControllers:(NSMutableArray *)viewControllers
             menuButtonTitles:(NSArray *)titles;

@end
