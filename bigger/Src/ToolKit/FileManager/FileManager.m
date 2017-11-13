//
//  FileManager.m
//  MYLC
//
//  Created by Lee on 16/4/20.
//  Copyright © 2016年 MR.S. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

+ (void)creatPlistFileWithFileName:(NSString *)fileName{
    
    NSString* filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",filePath);
    NSString * fileNamePath = [filePath stringByAppendingPathComponent:fileName];
    
    [[NSFileManager defaultManager] createFileAtPath:fileNamePath contents:nil attributes:nil];
    
}

+(NSString *)filePathByFileName:(NSString *)fileName{

    NSString* filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    return [filePath stringByAppendingPathComponent:fileName];
}

+ (BOOL)exitstsPlistFlieByFileName:(NSString *)fileName{

    NSString* filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString * fileNamePath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:fileNamePath]) {
        return NO;
    }
    
    return YES;
}

+ (void)parsingDictionary:(NSDictionary *)dictionary{
//    [self writeProvinceAndSchoolsDataToPlist:[dictionary objectForKey:@"schools"]];
    [self writeOthersDictionary:[dictionary objectForKey:@"dics"]];
}

+ (void)writeOthersDictionary:(NSArray *)dictionaryArrays{
    [self creatPlistFileWithFileName:@"dictionary.plist"];
    NSMutableArray *provArrays = [[NSMutableArray alloc]init];
    for (NSDictionary *provDiect in dictionaryArrays) {
        NSString *provStr = [provDiect objectForKey:@"typecode"];
        [provArrays addObject:provStr];
    }
    provArrays = [provArrays valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSMutableDictionary *dictMapDict = [[NSMutableDictionary alloc]init];
    NSMutableArray *provinceList = [NSMutableArray array];
    for (NSInteger i = 0; i<[dictionaryArrays count]; i++) {
        NSDictionary *dict = [dictionaryArrays objectAtIndex:i];
        NSString *typecode = [dict objectForKey:@"typecode"];
        NSString *dtypename = [dict objectForKey:@"typename"];
        [provinceList addObject:typecode];
        if ([dictMapDict objectForKey:typecode]) {
            NSMutableArray *list = [dictMapDict objectForKey:typecode];
            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
            [dictionary setValue:dtypename forKey:@"typename"];
            [dictionary setValue:[dict objectForKey:@"code"] forKey:@"code"];
            [dictionary setValue:[dict objectForKey:@"name"] forKey:@"name"];
            [list addObject:dictionary];
        }else{
            NSMutableArray *list = [[NSMutableArray alloc]init];
            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
            [dictionary setValue:dtypename forKey:@"typename"];
            [dictionary setValue:[dict objectForKey:@"code"] forKey:@"code"];
            [dictionary setValue:[dict objectForKey:@"name"] forKey:@"name"];
            [list addObject:dictionary];
            [dictMapDict  setValue:list forKey:typecode];
        }
    }
    [dictMapDict writeToFile:[self filePathByFileName:@"dictionary.plist"] atomically:YES];
}

+ (void)writeProvinceAndSchoolsDataToPlist:(NSArray *)schoolsArray{

    [self creatPlistFileWithFileName:@"Schools.plist"];
    NSMutableArray *provArrays = [[NSMutableArray alloc]init];
    for (NSDictionary *provDiect in schoolsArray) {
        NSString *provStr = [provDiect objectForKey:@"schoolprovince"];
        [provArrays addObject:provStr];
    }
    provArrays = [provArrays valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
    NSMutableArray *provListArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < [provArrays count]; i++) {
        NSString *provName = [provArrays objectAtIndex:i];
        NSMutableArray *schoolList = [[NSMutableArray alloc]init];
        for (NSInteger j = 0; j<[schoolsArray count]; j++) {
            NSDictionary *schoolDict = [schoolsArray objectAtIndex:j];
            NSString *schoolProvName = [schoolDict objectForKey:@"schoolprovince"];
            if ([schoolProvName isEqual:provName]) {
                [schoolList addObject:schoolDict];
            }
        }
        NSMutableDictionary *abc = [[NSMutableDictionary alloc]init];
        [abc setValue:schoolList forKey:@"school"];
        [abc setValue:provName forKey:@"province"];
        [provListArray addObject:abc];
    }
    [provListArray writeToFile:[self filePathByFileName:@"Schools.plist"] atomically:YES];
}

+(NSDictionary*)dataToCityValue:(NSDictionary* )dataDic{
    
    NSMutableDictionary* provinceDic = [NSMutableDictionary  dictionary];
    NSMutableArray* schools = [NSMutableArray array];
    NSMutableDictionary* city = [NSMutableDictionary dictionary];
    [city setObject:[dataDic objectForKey:@"school"] forKey:@"schoolName"];
    [city setObject:[dataDic objectForKey:@"sid"] forKey:@"schoolid"];
    [schools addObject:city];
    [provinceDic setValue:[dataDic objectForKey:@"schoolprovince"] forKey:@"provinceName"];
    [provinceDic setValue:schools forKey:@"schools"];
    
    return provinceDic;
}

+ (NSArray *)supportBankNameLists{
  
    if (![self exitstsPlistFlieByFileName:@"dictionary.plist"]) return nil;
    NSMutableDictionary * data = [[NSMutableDictionary alloc]initWithContentsOfFile:[self filePathByFileName:@"dictionary.plist"]];
    NSMutableArray * bankList = [NSMutableArray array];
    [[data objectForKey:@"supportbank"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [bankList addObject:[data[@"supportbank"][idx] objectForKey:@"name"]];
    }];
    return bankList;
}

@end
