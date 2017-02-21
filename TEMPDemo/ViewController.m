//
//  ViewController.m
//  TEMPDemo
//
//  Created by nero on 16/12/2.
//  Copyright © 2016年 xuzhanqiang. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"
#import "Car.h"
#import "Car+Location.h"
#import "UIViewController+Navigator.h"



@interface Person : NSObject
@property (nonatomic, strong) NSString *personName;
- (void)run;
+ (void)study;
@end

@implementation Person
- (void)run {
    NSLog(@"Person: run");
}
+ (void)study {
    NSLog(@"Person: study");
}
@end


@interface Bird : NSObject

@end

@implementation Bird


@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) NSHashTable *useTable;
@property (strong, nonatomic) NSMutableArray *useArray;
@property (strong, nonatomic) NSMutableDictionary *useDict;
@property (strong, nonatomic) NSMapTable *mapTable;
@end

typedef void(^MakeB)(int count);

@implementation ViewController

- (void)setDefaultData {
    Person *person = [[Person alloc] init];
    person.personName = @"person1";
    
    Person *person1 = [Person new];
    person1.personName = @"asdas";
    _useTable = [NSHashTable weakObjectsHashTable];
    [_useTable addObject:person];
    [_useTable addObject:person1];
    
    _useArray = [NSMutableArray array];
    [_useArray addObject:person];
    [_useArray addObject:person1];
    
    _useDict = [NSMutableDictionary dictionary];
    [_useDict setObject:person forKey:@"person"];
    [_useDict setObject:person1 forKey:@"person"];
    
    _mapTable = [NSMapTable weakToStrongObjectsMapTable];
    [_mapTable setObject:person1 forKey:@"person"];
    [_mapTable setObject:person forKey:@"person"];
    
    NSLog(@"11[table:%@][array:%@][dict:%@][map:%@]",_useTable,_useArray,_useDict,_mapTable);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultData];
    self.label1.text = @"9999999999";
    self.label2.text = @"9999999999";
    /**Andale Mono ; Consolas  Courier**/
    self.label1.font = [UIFont fontWithName:@"Courier" size:17];
    self.label2.font = [UIFont fontWithName:@"Menlo" size:17];

    NSArray *array1 = @[@"123",@"",@"234",@"",@"345"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF != %@",@""];
    NSArray *array2 = [array1 filteredArrayUsingPredicate:predicate];
    NSLog(@"array2:%@",array2);
    
    
    Car *car1 = [Car new];
    car1.price = 100;
    car1.name = @"奇瑞";
    [car1 descripetion];
    
    Car *car2 = [Car new];
    car2.price = 200;
    car2.name = @"BMW";
    car2.location = @"Germany";
    [car2 descripetion];
    
    Car *car3 = [car1 copy];
    Car *car4 = [car1 mutableCopy];
    
    

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
