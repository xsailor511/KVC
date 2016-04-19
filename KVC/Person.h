//
//  Person.h
//  KVC
//
//  Created by richard on 16/4/11.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Car.h"
@interface Person : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign) int age;
@property(nonatomic,strong)Book *book;

@property(nonatomic,copy) Book *book2;

@property(nonatomic,copy) Book *book3;

@property(nonatomic,strong) Car *car;

//-(void)setBook2:(Book *)book;
//-(void)printBook2;

@end
