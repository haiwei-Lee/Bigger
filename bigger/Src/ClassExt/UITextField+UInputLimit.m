//
//  UITextField+UInputLimit.m
//  uloan
//
//  Created by Lee on 2017/8/18.
//  Copyright © 2017年 cashbang. All rights reserved.
//

#import "UITextField+UInputLimit.h"
#import <objc/runtime.h>

static const void * UTextFieldInputLimitMaxLength = &UTextFieldInputLimitMaxLength;

@implementation UITextField (UInputLimit)

- (NSInteger)ufo_maxLength {
    return [objc_getAssociatedObject(self, UTextFieldInputLimitMaxLength) integerValue];
}
- (void)setUfo_maxLength:(NSInteger)ufo_maxLength {
    objc_setAssociatedObject(self, UTextFieldInputLimitMaxLength, @(ufo_maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(ufo_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)ufo_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.ufo_maxLength > 0 && toBeString.length > self.ufo_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.ufo_maxLength];
        if (rangeIndex.length == 1)
        {
          
            self.text = [toBeString substringToIndex:self.ufo_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.ufo_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.ufo_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}


@end
