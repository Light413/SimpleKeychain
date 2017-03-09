//
//  SimpleKeychain.m
//  SimpleKeychainDemo
//
//  Created by gener on 17/3/9.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "SimpleKeychain.h"
#import <Security/Security.h>

@implementation SimpleKeychain

+(BOOL)setObject:(id)object forKey:(NSString *)key
{
    BOOL resultCode = NO;
    SimpleKeychain *_instance = [[SimpleKeychain alloc]init];
    
    id search = [_instance findItemWith:key];
    if (search) {
      resultCode =  [_instance updateItmeWith:key value:object];
    }
    else
    {
      resultCode =  [_instance addItmeWith:key value:object];
    }
    
    return resultCode;
}

+(id)objectForKey:(NSString *)key
{
    return [[[self alloc]init]findItemWith:key];
}

+(BOOL)deleteItmeWith:(NSString*)key
{
    return [[[self alloc]init]deleteItmeWith:key];
}





/////////////////private
-(id)findItemWith:(NSString*)key
{
    NSDictionary * query = [NSDictionary dictionaryWithObjectsAndKeys:
                            (__bridge id)kSecClassGenericPassword,kSecClass,
                            key,kSecAttrGeneric,
                            kSecMatchLimitOne,kSecMatchLimit,
                            kCFBooleanTrue,kSecReturnData,
                            nil];
    
    NSData * result;
    CFTypeRef outdata =  (__bridge CFTypeRef)result;
    if(SecItemCopyMatching((__bridge CFDictionaryRef)query, &outdata) == errSecSuccess)
    {
        NSString *str=[[NSString alloc]initWithData:(__bridge NSData*)outdata encoding:NSUTF8StringEncoding];
        return str;
    }

    return nil;
}

-(BOOL)addItmeWith:(NSString*)key value:(NSString*)value
{
    NSDictionary * query = [NSDictionary dictionaryWithObjectsAndKeys:
                            (__bridge id)kSecClassGenericPassword,kSecClass,
                            key,kSecAttrGeneric,
                            key,kSecAttrService,
                            key,kSecAttrAccount,
                            
                            [value dataUsingEncoding:NSUTF8StringEncoding],kSecValueData,
                            nil];
    
    id obj;
    CFTypeRef outdata = (__bridge CFTypeRef)obj;
    OSStatus resultCode = SecItemAdd((__bridge CFDictionaryRef)query, &outdata);
    
    return resultCode == errSecSuccess;
}

-(BOOL)updateItmeWith:(NSString*)key value:(NSString*)value
{
    NSDictionary * query = [NSDictionary dictionaryWithObjectsAndKeys:
                            (__bridge id)kSecClassGenericPassword,kSecClass,
                            key,kSecAttrGeneric,
                            key,kSecAttrService,
                            key,kSecAttrAccount,
                            nil];
    
    NSDictionary * des = [NSDictionary dictionaryWithObjectsAndKeys:[value dataUsingEncoding:NSUTF8StringEncoding],kSecValueData, nil];
    OSStatus resultCode = SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)des);
    return resultCode == errSecSuccess;
}


-(BOOL)deleteItmeWith:(NSString*)key
{
    NSDictionary * query = [NSDictionary dictionaryWithObjectsAndKeys:
                            (__bridge id)kSecClassGenericPassword,kSecClass,
                            key,kSecAttrGeneric,
                            nil];
    
    OSStatus resultCode =  SecItemDelete((__bridge CFDictionaryRef)query);
    return resultCode == errSecSuccess;
}


@end
