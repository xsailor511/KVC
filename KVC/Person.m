//
//  Person.m
//  KVC
//
//  Created by richard on 16/4/11.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import "Person.h"

@implementation Person
//@synthesize book2;

-(NSString *)description
{
    //重写description方法，拼一个字符串，按既定个数输出
    return [NSString stringWithFormat:@"<%@:%p>,{name:%@,age:%d}",[self class],self,self.name,self.age];
}

//-(void)setBook2:(Book *)booknew{
//    book2 = booknew;
//}

-(void)printBook2{
    NSLog(@"book2 name = %@",_book2.bookname);
}

-(BOOL)respondsToSelector:(SEL)aSelector{
    NSLog(@"respondsToSelector = %@",NSStringFromSelector(aSelector));
    if ([_car respondsToSelector:aSelector]) {
        NSLog(@"respondsToSelector return yes = %@",NSStringFromSelector(aSelector));
        return YES;
    }
    return NO;
}

/**
 *  消息转发，处理未定义的方法
 *
 *  @param aSelector <#aSelector description#>
 *
 *  @return <#return value description#>
 */
-(id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *selectorString = NSStringFromSelector(aSelector);
    NSLog(@"selectorString =%@",selectorString);
    if ([selectorString isEqualToString:@"setBookname:"]) {
        NSLog(@"the selector is setBookname:");
        return _book2;
    }
    
    NSLog(@"forwardingTargetForSelector return nil");
    
    return nil;
}


-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *sig;
    sig = [_car methodSignatureForSelector:aSelector];
    NSLog(@"methodSignatureForSelector");
    return sig;
}

/**
 *  完整的消息转发
 *
 *  @param anInvocation <#anInvocation description#>
 */
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"invokeWithTarget car");
    [anInvocation invokeWithTarget:_car];
}

@end
