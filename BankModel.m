//
//  BankModel.m
//  plistrw
//
//  Created by pro on 15/7/3.
//  Copyright (c) 2015年 pro. All rights reserved.
//

#import "BankModel.h"

@implementation BankModel
-(id)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if(self)
    {
        self.bankName = json[@"bankName"];
        self.bankType = json[@"bankType"];
        self.regex = json[@"regex"];
        
    }
    return self;
}

@end


