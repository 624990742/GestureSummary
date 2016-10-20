//
//  RevealLayer.m
//  橡皮擦练习
//


#import "RevealLayer.h"

@implementation RevealLayer
- (UIBezierPath *)drawingPath
{
    if ( !_drawingPath )
    {
        _drawingPath = [UIBezierPath new];
        [_drawingPath moveToPoint:CGPointZero];
        [_drawingPath setLineWidth:20.0];
        [_drawingPath setLineCapStyle:kCGLineCapRound];
    }
    return( _drawingPath );
}

- (void)drawInContext:(CGContextRef)context
{
    UIGraphicsPushContext( context );
    
    [[UIColor darkGrayColor] set];
    CGContextFillRect( context, self.bounds );
    
    CGContextSetBlendMode( context, kCGBlendModeClear );
    [self.drawingPath stroke];
    
    UIGraphicsPopContext();
}


@end
