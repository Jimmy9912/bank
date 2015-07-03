//
//  BankModel.h
//  plistrw
//
//  Created by pro on 15/7/3.
//  Copyright (c) 2015年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankModel : NSObject
/**
 *  银行名称
 */
@property(nonatomic,strong)NSString *bankName;
/**
 *  验证正则
 */
@property(nonatomic,strong)NSString *regex;
/**
 *  银行类型 储蓄卡 信用卡 准贷记卡 预付费卡
 */
@property(nonatomic,strong)NSString *bankTypeName;
/**
 *  银行卡简写 
 DC:"储蓄卡",
 CC:"信用卡",
 SCC:"准贷记卡",
 PC:"预付费卡"
 */
@property(nonatomic,strong)NSString *bankType;
- (id)initWithJson:(NSDictionary *)json;
@end
