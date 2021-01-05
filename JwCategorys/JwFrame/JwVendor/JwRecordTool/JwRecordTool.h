//
//  JwRecordTool.h
//  JwCategorys
//
//  Created by 陈警卫 on 2020/9/3.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JwRecordTool;

@protocol JwRecordToolDetegate <NSObject>

@optional
- (void)jw_recordTool:(JwRecordTool *)recordTool didStartRecoring:(CGFloat)value;
- (void)jw_recordTool:(JwRecordTool *)recordTool didFinishedFlag:(BOOL)flag;

@end

@interface JwRecordTool : NSObject

/** 单例 */
+ (JwRecordTool *)sharedTool;
/**
开始录音
duration = 0 手动结束
*/
- (void)startRecordingDuration:(CGFloat)duration;
- (void)startRecording;

/** 停止录音 */
- (void)stopRecording;

/** 销毁录音文件 */
- (void)destructionRecordingFile;

/** 更新音量参数的代理 */
@property (nonatomic, assign) id<JwRecordToolDetegate> delegate;
/** 录音实例 */
- (AVAudioRecorder *)audioRecorder;

/** 获取录音路径 */
- (NSString *)recordFilePath;




@end

NS_ASSUME_NONNULL_END
