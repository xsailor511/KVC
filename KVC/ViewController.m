//
//  ViewController.m
//  KVC
//
//  Created by richard on 16/4/11.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "IRESPaopaoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p1 = [[Person alloc] init];
    [p1 setValue:@"Jack" forKey:@"name"];
    [p1 setValue:@"20" forKey:@"age"];
    
    Book *book1 = [[Book alloc] init];
    [book1 setValue:@"android" forKey:@"bookname"];
    
    [p1 setValue:book1 forKey:@"book"];
    
    Person *p2 = [[Person alloc] init];
    [p2 setValue:@"Tom" forKey:@"name"];
    [p2 setValue:@"34" forKey:@"age"];
    
    Book *book2 = [[Book alloc] init];
    [book2 setValue:@"ios" forKey:@"bookname"];
    
    [p2 setValue:book2 forKey:@"book"];
    
    NSLog(@"%@%@", p1 , [p2  valueForKeyPath:@"name"]);
    
    
    //常见打印一个数组里对象的某个值，建立一个存储person对象的数组，并打印
    NSArray *persons=@[p1,p2];
    NSLog(@"%@",persons);
    
    NSMutableArray *arrayM=[NSMutableArray array];
    for (Person *p in persons) {
        [arrayM addObject:[p valueForKeyPath:@"name"]];
    }
    NSLog(@"%@",arrayM);
    
    //kvc 打印数组里对象的某个值
    //建立一个存储person对象的数组，并打印
    NSArray *persons2=@[p1,p2];
    NSLog(@"%@",persons2);
    
    NSMutableArray *arrayM2=[NSMutableArray array];
    //可以直接操作数组，说明键值取值时，会深入对象的内部，层层深入
    [arrayM addObject:[persons2 valueForKeyPath:@"name"]];
    NSLog(@"%@",arrayM2);
    
    
    NSArray *arrayBook=[persons valueForKeyPath:@"book.bookname"];
    NSLog(@"%@",arrayBook);
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Book *book2 = [[Book alloc] init];
    [book2 setBookname:@"java"];
    
    Person *person = [[Person alloc] init];
    [person setBook2:book2];
    
    //测试消息转发，person没有setBookname方法，它会将消息转发给自己的_book2实例变量
    NSObject *object = person;
    Book *tempBook = (Book*)object;
    [tempBook setBookname:@"123324"];
    //book2 test release = 123324表示消息转发成功
    NSLog(@"book2 test release = %@",person.book2.bookname);
    //[person printBook2];
    //完整的消息转发
    Car *myCar = [[Car alloc] init];
    [person setCar:myCar];
    
    Car *car = (Car*)person;
    [car setCarName:@"dazhong"];
    
    NSLog(@"person car name = %@",person.car.carName);
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    IRESPaopaoView *view = [[IRESPaopaoView alloc] initWithTitle:@"123324353" frame:CGRectMake(70, 100, 200, 60)];
    [view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
