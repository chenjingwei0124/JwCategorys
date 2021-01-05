//
//  JwRecordTool.m
//  JwCategorys
//
//  Created by 陈警卫 on 2020/9/3.
//  Copyright © 2020 陈警卫. All rights reserved.
//

#import "JwRecordTool.h"

#define RecordFielName @"record.wav"

@interface JwRecordTool () <AVAudioRecorderDelegate>
/** 录音文件地址 */
@property (nonatomic, strong) NSURL *recordFileUrl;
/** 定时器 */
@property (nonatomic, strong) NSTimer *recorderTimer;
/** 录音对象 */
@property (nonatomic, strong) AVAudioRecorder *recorder;

@end

 
@implementation JwRecordTool

- (void)dealloc{
    //内存释放前先停止录音
    if (self.recorder){
        if ([self.recorder isRecording]){
            [self.recorder stop];
        }
        self.recorder = nil;
    }
    //停掉计时器
    [self stopTimer];
}

/** 单例 */
+ (JwRecordTool *)sharedTool{
    static JwRecordTool *recordTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        recordTool = [[JwRecordTool alloc] init];
    });
    return recordTool;
}

/** 录音实例*/
- (AVAudioRecorder *)audioRecorder{
    return self.recorder;
}

/** 获取录音路径 */
- (NSString *)recordFilePath{
    return self.recordFileUrl.absoluteString;
}

/**
 开始录音
 duration = 0 手动结束
 */
- (void)startRecordingDuration:(CGFloat)duration{
    [self destructionRecordingFile];
    [self startTimer];
    if (duration == 0) {
        [self.recorder record];
    }else{
        [self.recorder recordForDuration:duration];
    }
}

- (void)startRecording{
    [self startRecordingDuration:0];
}

/** 停止录音 */
- (void)stopRecording{
    if (self.recorder){
        if ([self.recorder isRecording]){
            [self.recorder stop];
        }
    }
    [self stopTimer];
}

/** 销毁录音文件 */
- (void)destructionRecordingFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (self.recordFileUrl) {
        [fileManager removeItemAtURL:self.recordFileUrl error:NULL];
    }
}

- (AVAudioRecorder *)recorder {
    if (!_recorder) {
        //获取沙盒地址
        
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filePath = [path stringByAppendingPathComponent:RecordFielName];
        _recordFileUrl = [NSURL fileURLWithPath:filePath];
        
        //设置录音的一些参数
        NSMutableDictionary *setting = [NSMutableDictionary dictionary];
        //音频格式
        setting[AVFormatIDKey] = @(kAudioFormatLinearPCM);
        //录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
        setting[AVSampleRateKey] = @(16000);
        //音频通道数 1 或 2
        setting[AVNumberOfChannelsKey] = @(1);
        //线性音频的位深度 8、16、24、32
        setting[AVLinearPCMBitDepthKey] = @(16);
        //录音的质量
        setting[AVEncoderAudioQualityKey] = [NSNumber numberWithInt:AVAudioQualityHigh];
        
        _recorder = [[AVAudioRecorder alloc] initWithURL:self.recordFileUrl settings:setting error:NULL];
        _recorder.delegate = self;
        _recorder.meteringEnabled = YES;
        
        AVAudioSession *recoderSession = [AVAudioSession sharedInstance];
        [recoderSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [recoderSession setActive:YES error:nil];
        
        [_recorder prepareToRecord];
    }
    return _recorder;
}

- (void)startTimer{
    [self stopTimer];
    self.recorderTimer = [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(recorderVoiceChange) userInfo:nil repeats:YES];
}

- (void)stopTimer{
    if (self.recorderTimer){
        [self.recorderTimer invalidate];
    }
    self.recorderTimer = nil;
}

- (void)recorderVoiceChange{
    if (self.recorder) {
        [self.recorder updateMeters];
        CGFloat normalizedValue = pow(10, 0.05 * [self.recorder averagePowerForChannel:0]);
        
        if (_delegate && [_delegate respondsToSelector:@selector(jw_recordTool:didStartRecoring:)]) {
            [_delegate jw_recordTool:self didStartRecoring:normalizedValue];
        }
    }
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    if (_delegate && [_delegate respondsToSelector:@selector(jw_recordTool:didFinishedFlag:)]) {
        [_delegate jw_recordTool:self didFinishedFlag:flag];
    }
}

@end
