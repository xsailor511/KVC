//
//  IRESPaopaoView.m
//  TopView
//
//  Created by richard on 16/4/18.
//  Copyright © 2016年 ZTESoft. All rights reserved.
//

#import "IRESPaopaoView.h"

@implementation IRESPaopaoView


-(id)initWithTitle:(NSString*)title frame:(CGRect)frame;{
    self = [super initWithFrame:frame];
    if (self) {
        //[self setBackgroundColor:[UIColor clearColor]];
        self.title = [title copy];
    }
    return self;
    
}

-(void)drawRect:(CGRect)rect{
    [self setBackgroundColor:nil];
    
    self.opaque = YES;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //矩形，并填弃颜色
//    CGContextSetLineWidth(context, 2.0);//线的宽度
//
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);//填充颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);//线框颜色
//    CGContextAddRect(context,self.frame);//画方框
//    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    
    NSMutableDictionary *attrDic = [[NSMutableDictionary alloc] init];
    
    [attrDic setObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName];
    CGFloat h=[_title boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil].size.height;
    CGFloat labelHeight = h + 25;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, labelHeight)];
    
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:15]];
    [label setTextColor:[UIColor blackColor]];
    label.text = _title;
    [label setNumberOfLines:0];
    [label.layer setMasksToBounds:YES];
    [label.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    
    //UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 00, labelHeight+25)];
    
    //[self setAlpha:0.5];
    [self addSubview:label];
    
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);//填充颜色
    /*画三角形*/
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(100-15, labelHeight);//坐标1
    sPoints[1] =CGPointMake(100+15, labelHeight);//坐标2
    sPoints[2] =CGPointMake(100, labelHeight+15);//坐标3
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    CGContextRestoreGState(context);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
