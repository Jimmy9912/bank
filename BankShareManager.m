//
//  BankShareManager.m
//  plistrw
//
//  Created by pro on 15/7/3.
//  Copyright (c) 2015年 pro. All rights reserved.
//

#import "BankShareManager.h"
static NSArray *bankArr;
@implementation BankShareManager

+ (BankShareManager *)shareManager
{
    static BankShareManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BankShareManager alloc] init];
    });
    return manager;
}

- (id)init
{
    self = [super init];
    if(self){
        bankArr = [self realocalPlist];
        
    }
    return self;
}

-(NSArray *)realocalPlist
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bank" ofType:@"plist"];
    NSArray *arr = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return arr;
}

-(BankModel *)getBankInfo:(NSString *)bankCode
{
    BankModel *model;
    for(NSDictionary *dic in bankArr)
    {
        BankModel *temp= [[BankModel alloc]initWithJson:dic];
        NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", temp.regex];
        BOOL flag = [regextest evaluateWithObject:bankCode];
        if(flag)
        {
            temp.bankTypeName = [self getBankTypeName:temp.bankType];
            model =temp;
            break;
        }
    }
    return model;
}

-(NSString *)getBankTypeName:(NSString *)bankType
{
    NSString *typeName = [[NSString alloc]init];
    if([bankType isEqualToString:@"CC"])
    {
     typeName = @"信用卡";
    }
    else if([bankType isEqualToString:@"PC"])
    {
    typeName = @"预付费卡";
    }
    else if([bankType isEqualToString:@"SCC"])
    {
        typeName = @"准贷记卡";
    }
    else if([bankType isEqualToString:@"DC"])
    {
        typeName = @"储蓄卡";
    }
    
    return typeName;
}
@end
