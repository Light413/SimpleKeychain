//
//  SimpleKeychain.h
//  SimpleKeychainDemo
//
//  Created by gener on 17/3/9.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleKeychain : NSObject

/**
 set a Keychain item

 @param object value
 @param key    key

 @return success : YES  otherwise retuen NO
 */
+(BOOL)setObject:(id)object forKey:(NSString *)key;


+(id)objectForKey:(NSString *)key;

+(BOOL)deleteItmeWith:(NSString*)key;


@end
