#import <UIKit/UIKit.h>

@interface GuidedTourViewController : UIViewController <UIPageViewControllerDataSource> {

    int indexCurrentPage;
    
    UIToolbar *toolBar;

    UIBarButtonItem *rightBarButton;
    UIBarButtonItem *leftBarButton;
    UIBarButtonItem *space;
    
}

@property (strong, nonatomic) UIPageViewController *pageController;

@end