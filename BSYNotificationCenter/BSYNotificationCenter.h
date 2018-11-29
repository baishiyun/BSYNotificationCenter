//
//  BSYNotificationCenter.h
//  GoldenSoftFoods
//
//  Created by 白仕云 on 2018/11/26.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^Successted)(id obj);

@interface BSYNotificationCenter : NSObject


/**
 单利
 */
+(BSYNotificationCenter *)shareCenter;


/**
 添加通知
 @param CenterName 通知名称
 @param object 参数
 @param  SuccessRemove 注册成功后立即删除通知 （True：删除，False：不删除）
 */
-(void)bsy_RegisterCenterName:(nonnull NSNotificationName )CenterName object:(nullable id)object SuccessRemove:(BOOL)SuccessRemove;


/**
 接受通知
 @param goal 目标者
 @param actionMothed 方法名称
 @param CenterName 通知名称
@param  SuccessRemove 接受成功后立即删除通知 （True：删除，False：不删除）
 @param backBlock 接受后回调
 */
-(void)bsy_addGoal:(nonnull id)goal ActionMothed:(NSString *)actionMothed  CenterName:(NSNotificationName )CenterName queue:(NSOperationQueue*)queue SuccessRemove:(BOOL)SuccessRemove  BackBlock:(Successted)backBlock;
/**
 删除目标中的所有通知
 @param goal 目标
 */
-(void)bsy_removeGoal:(nonnull id)goal;


/**
 删除具体的通知
 @param goal 目标
 @param CenterName 通知名称
 */
-(void)bsy_removeGoal:(nonnull id)goal  CenterName:(nonnull NSNotificationName )CenterName;

@end

NS_ASSUME_NONNULL_END
