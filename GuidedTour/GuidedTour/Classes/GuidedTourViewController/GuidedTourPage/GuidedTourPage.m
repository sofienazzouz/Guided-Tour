#import "GuidedTourPage.h"

@interface GuidedTourPage ()

@end

@implementation GuidedTourPage
@synthesize imageView,titleGuide,descriptionGuide,index;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
   
        self = [super initWithNibName:@"GuidedTourPage" bundle:nibBundleOrNil];

    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
        image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d.jpg", index]];
        [imageView setImage:image];
        titleGuide.text = [NSString stringWithFormat:@"Title %d", index];
        descriptionGuide.text = [NSString stringWithFormat:@"Description %d", index];

    
}

@end
