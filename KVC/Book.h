//
//  Book.h
//  KVC
//
//  Created by richard on 16/4/11.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject<NSCopying,NSMutableCopying>

@property(nonatomic,copy)NSString *bookname;

@end
