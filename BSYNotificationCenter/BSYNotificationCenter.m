//
//  BSYNotificationCenter.m
//  GoldenSoftFoods
//
//  Created by 白仕云 on 2018/11/26.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import "BSYNotificationCenter.h"

static BSYNotificationCenter*_shareCenter;

@interface BSYNotificationCenter()
@property (nonatomic ,strong,nonnull)NSMutableDictionary * bsy_object;
@end


@implementation BSYNotificationCenter

/**
 单利
 */
+(BSYNotificationCenter *)shareCenter
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shareCenter=[[BSYNotificationCenter alloc]init];
    });
    return _shareCenter;
}

/**
 添加通知
 @param CenterName 通知名称
 @param object 参数
 @param backBlock 注册后回调
 */
-(void)bsy_RegisterCenterName:(nonnull NSNotificationName )CenterName object:(nullable id)object
{
    NSNotification *notification =[NSNotification notificationWithName:CenterName object:nil userInfo:object];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
/**
 接受通知
 @param actionMothed 方法名称
 @param CenterName 通知名称
 @param  SuccessRemove 接受成功后立即删除通知 （True：删除，False：不删除）
 @param backBlock 接受后回调
 */
-(void)bsy_addGoal:(nonnull id)goal ActionMothed:(NSString *)actionMothed  CenterName:(NSNotificationName )CenterName queue:(NSOperationQueue*)queue SuccessRemove:(BOOL)SuccessRemove  BackBlock:(Successted)backBlock{

    [[NSNotificationCenter defaultCenter] addObserverForName:CenterName object:nil queue:queue usingBlock:^(NSNotification * _Nonnull note) {
        if (backBlock) {
            backBlock(note.userInfo);
        }
        if (SuccessRemove==true) {
            [self bsy_removeGoal:goal CenterName:CenterName];
        }
    }];
}

/**
 删除目标中的所有通知
 @param goal 目标
 */
-(void)bsy_removeGoal:(nonnull id)goal
{
    [[NSNotificationCenter defaultCenter] removeObserver:goal];
}
/**
 删除具体的通知
 @param goal 目标
 @param CenterName 通知名称
 */
-(void)bsy_removeGoal:(nonnull id)goal  CenterName:(nonnull NSNotificationName )CenterName
{
    [[NSNotificationCenter defaultCenter] removeObserver:goal name:CenterName object:nil];
}

@end
