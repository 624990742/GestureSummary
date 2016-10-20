//
//  CustomView.m
//  橡皮擦练习
//


#import "CustomView.h"
#import "RevealLayer.h"
@interface CustomView()
@property (strong, nonatomic) RevealLayer *revealLayer;
/**<#name#>**/
@property(nonatomic,strong)UIImageView *image;


@end

@implementation CustomView
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
    
}
- (void)setup
{
    self.userInteractionEnabled = YES;
    [self setMultipleTouchEnabled:NO];
    
    self.image = [[UIImageView alloc]initWithFrame:self.bounds];
    [_image setImage:[UIImage imageNamed:@"10957553836910724"]];
    [self addSubview:_image];
    
    self.revealLayer = [[RevealLayer alloc]init];
    self.revealLayer.frame = self.bounds;
    self.revealLayer.backgroundColor = [[UIColor clearColor] CGColor];
    [self.revealLayer setNeedsDisplay];
    
    [self.layer addSublayer:self.revealLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    [self.revealLayer.drawingPath moveToPoint:location];
    [self.revealLayer setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    [self.revealLayer.drawingPath addLineToPoint:location];
    [self.revealLayer setNeedsDisplay];
}@end
