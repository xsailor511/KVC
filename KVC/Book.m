//
//  Book.m
//  KVC
//
//  Created by richard on 16/4/11.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import "Book.h"

@implementation Book

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@,%p>{bookname:%@}", [self class],self,self.bookname];
}

- (id)copyWithZone:(nullable NSZone *)zone{
    Book *b = [[Book allocWithZone:zone] init];
    b.bookname = self.bookname;
    return b;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    Book *b = [[Book allocWithZone:zone] init];
    b.bookname = self.bookname;
    return b;
}




@end
