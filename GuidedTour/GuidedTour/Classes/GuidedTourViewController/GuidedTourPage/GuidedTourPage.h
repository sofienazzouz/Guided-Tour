#import <UIKit/UIKit.h>
@interface GuidedTourPage : UIViewController
{
    UIImage *image;
}

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *titleGuide;
@property (strong, nonatomic) IBOutlet UITextView *descriptionGuide;

@end
