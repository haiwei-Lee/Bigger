//
//  FileManager.h
//  MYLC
//
//  Created by Lee on 16/4/20.
//  Copyright © 2016年 MR.S. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^bankListBlock) (NSArray * banks);

@interface FileManager : NSObject

+ (void)creatPlistFileWithFileName:(NSString *)fileName;

+ (void)parsingDictionary:(NSDictionary *)dictionary;

+(NSString *)filePathByFileName:(NSString *)fileName;

+ (BOOL)exitstsPlistFlieByFileName:(NSString *)fileName;

+ (NSArray *)supportBankNameLists;


@end
