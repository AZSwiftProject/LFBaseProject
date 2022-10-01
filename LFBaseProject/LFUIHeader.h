//
//  LFUIHeader.h
//  LFBaseProject
//
//  Created by admin on 2022/8/24.
//

#ifndef LFUIHeader_h
#define LFUIHeader_h

// 防止多次调用
#define kRepeatClickTime(_seconds_) \
static BOOL shouldPrevent; \
if (shouldPrevent) return; \
shouldPrevent = YES; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_seconds_) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
shouldPrevent = NO; \
}); \

#endif /* LFUIHeader_h */
