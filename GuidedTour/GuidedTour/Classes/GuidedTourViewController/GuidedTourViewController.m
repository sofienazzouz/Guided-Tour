#import "GuidedTourViewController.h"
#import "GuidedTourPage.h"
#import "HomeViewController.h"
@interface GuidedTourViewController ()

@end


@implementation GuidedTourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
   
        self = [super initWithNibName:@"GuidedTourViewController" bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
 
    space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIImage *startImage = [UIImage imageNamed:@"start.png"];
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
    [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
    [startButton setImage:startImage forState:UIControlStateNormal];
    rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
    rightBarButton.tag = 0;
    
    UIImage *homeImage = [UIImage imageNamed:@"end.png"];
    UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
    [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
    [homeButton setImage:homeImage forState:UIControlStateNormal];
    leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    leftBarButton.tag = 1;

    CGRect toolbarFrame;
    
  
    toolbarFrame = CGRectMake(0, self.view.bounds.size.height-44, self.view.bounds.size.width, 44);
    
    toolBar = [[UIToolbar alloc]initWithFrame:toolbarFrame];
   // toolBar.barTintColor = [UIColor whiteColor];
    
    NSArray *array = [NSArray arrayWithObjects:leftBarButton,space,rightBarButton, nil];
    toolBar.items = array;
  
    // PageControl layout
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor clearColor];
    
    pageControl = [UIPageControl appearanceWhenContainedIn:[self class], nil];

    indexCurrentPage = 0;
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    GuidedTourPage *initialViewController = [self viewControllerAtIndex:0];

    [[self.pageController view] setFrame:[[initialViewController view] bounds]];

    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];

    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    [self addChildViewController:self.pageController];
   
    
    [self.view addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    [self.view addSubview:toolBar];
    
}

- (GuidedTourPage *)viewControllerAtIndex:(NSUInteger)index {
    GuidedTourPage *childViewController = [[GuidedTourPage alloc] initWithNibName:@"GuidedTourViewController" bundle:nil];
    
    childViewController.index = index;

    return childViewController;
}

#pragma mark - Page View Controller Delegates

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((GuidedTourPage *)viewController).index;

    indexCurrentPage = index;
    [self changeButtonsImages];

    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((GuidedTourPage *)viewController).index;

    indexCurrentPage = index;
    [self changeButtonsImages];

    if (index == 4 || index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return indexCurrentPage;
}

- (void)changeButtonsImages {
    
    if (indexCurrentPage == 0 && leftBarButton.tag == 0) {
        UIImage *homeImage = [UIImage imageNamed:@"end.png"];
        UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
        [homeButton setImage:homeImage forState:UIControlStateNormal];
        leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        leftBarButton.tag = 1;
        
        UIImage *startImage = [UIImage imageNamed:@"start.png"];
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
        [startButton setImage:startImage forState:UIControlStateNormal];
        rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
        rightBarButton.tag = 0;
        

    }
    else if (indexCurrentPage == 1) {
        UIImage *homeImage = [UIImage imageNamed:@"previous.jpg"];
        UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
        [homeButton setImage:homeImage forState:UIControlStateNormal];
        leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        leftBarButton.tag = 0;
        
        UIImage *startImage = [UIImage imageNamed:@"next.jpg"];
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
        [startButton setImage:startImage forState:UIControlStateNormal];
        rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
        rightBarButton.tag = 0;
    }
    else if (indexCurrentPage == 2) {
        UIImage *homeImage = [UIImage imageNamed:@"previous.jpg"];
        UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
        [homeButton setImage:homeImage forState:UIControlStateNormal];
        leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        leftBarButton.tag = 0;
        
        UIImage *startImage = [UIImage imageNamed:@"next.jpg"];
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
        [startButton setImage:startImage forState:UIControlStateNormal];
        rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
        rightBarButton.tag = 0;
    }
    else if (indexCurrentPage == 3) {
        UIImage *homeImage = [UIImage imageNamed:@"previous.jpg"];
        UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
        [homeButton setImage:homeImage forState:UIControlStateNormal];
        leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        leftBarButton.tag = 0;
        
        UIImage *startImage = [UIImage imageNamed:@"next.jpg"];
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
        [startButton setImage:startImage forState:UIControlStateNormal];
        rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
        rightBarButton.tag = 0;
    }
    else if (indexCurrentPage == 4 && rightBarButton.tag == 0) {

        UIImage *homeImage = [UIImage imageNamed:@"previous.jpg"];
        UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [homeButton addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchDown];
        [homeButton setImage:homeImage forState:UIControlStateNormal];
        leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        leftBarButton.tag = 0;
        
        UIImage *startImage = [UIImage imageNamed:@"end.png"];
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45,32)];
        [startButton addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchDown];
        [startButton setImage:startImage forState:UIControlStateNormal];
        rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:startButton];
        rightBarButton.tag = 1;
    }

    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.3;

    [toolBar.layer addAnimation:animation forKey:nil];
    
    NSArray *array = [NSArray arrayWithObjects:leftBarButton,space,rightBarButton, nil];
    toolBar.items = array;
    
   
    [self.view addSubview:toolBar];
    
}
#pragma mark - DISABLE ORIENTATION
- (BOOL)shouldAutorotate {
    return NO;
}

#pragma mark - ACTIONS
- (void)nextButton {
    if (rightBarButton.tag == 0 && indexCurrentPage < 4) {
        indexCurrentPage = indexCurrentPage + 1;
        GuidedTourPage *initialViewController = [self viewControllerAtIndex:indexCurrentPage];

        [[self.pageController view] setFrame:[[initialViewController view] bounds]];
        NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
        [self changeButtonsImages];
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    else if (rightBarButton.tag == 1) {
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }
}

- (void)previousButton {
    NSLog(@"1111");
    if (leftBarButton.tag == 0 && indexCurrentPage > 0) {
        indexCurrentPage = indexCurrentPage - 1;
        GuidedTourPage *initialViewController = [self viewControllerAtIndex:indexCurrentPage];

        [[self.pageController view] setFrame:[[initialViewController view] bounds]];
        NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
        [self changeButtonsImages];
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    else if (leftBarButton.tag == 1) {
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{

}


@end