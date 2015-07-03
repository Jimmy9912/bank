//
//  BankShareManager.h
//  plistrw
//
//  Created by pro on 15/7/3.
//  Copyright (c) 2015年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankModel.h"
@interface BankShareManager : NSObject
+ (BankShareManager *)shareManager;
-(NSArray *)realocalPlist;

/**
 *  根据银行卡号读取银行信息
 *
 *  @param bankCode 银行卡号
 *
 *  @return 银行名称，银行卡类型
 */
-(BankModel *)getBankInfo:(NSString *)bankCode;
@end
