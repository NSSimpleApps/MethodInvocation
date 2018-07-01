//
//  ObjcClass.m
//  MethodInvocation
//
//  Created by NSSimpleApps on 19.11.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "ObjcClass.h"

@implementation ObjcClass

- (void)voidMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
}

- (NSInteger)integerMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
    
    return integer + 1;
}

- (NSString *)stringMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
    
    return [NSString stringWithFormat:@"string for integer: %ld", (long)integer];
}

- (NSString *)stringMethodForString:(NSString *)string {
    NSLog(@"%s %@", __func__, string);
    
    return [NSString stringWithFormat:@"string for string: %@", string];
}

+ (void)voidClassMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
}

+ (NSInteger)integerClassMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
    
    return integer + 1;
}
+ (NSString *)stringClassMethodForInteger:(NSInteger)integer {
    NSLog(@"%s %ld", __func__, (long)integer);
    
    return [NSString stringWithFormat:@"string for integer: %ld", (long)integer];
}

@end
