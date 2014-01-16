//
//  ArrayUtils.m
//
//  Version 1.2
//
//  Created by Nick Lockwood on 01/03/2012.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/ArrayUtils
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "ArrayUtils.h"


#pragma GCC diagnostic ignored "-Wgnu"


@implementation NSArray (ArrayUtils)

- (NSArray *)arrayByRemovingObject:(id)object
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array removeObject:object];
    return array;
}

- (NSArray *)arrayByRemovingObjectAtIndex:(NSUInteger)index
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array removeObjectAtIndex:index];
    return array;
}

- (NSArray *)arrayByRemovingLastObject
{
    if ([self count])
    {
        NSMutableArray *array = [NSMutableArray arrayWithArray:self];
        [array removeObjectAtIndex:[self count] - 1];
        return array;
    }
    return [NSArray arrayWithArray:self];
}

- (NSArray *)arrayByRemovingFirstObject
{
    if ([self count])
    {
        NSMutableArray *array = [NSMutableArray arrayWithArray:self];
        [array removeObjectAtIndex:0];
        return array;
    }
    return [NSArray arrayWithArray:self];
}

- (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array insertObject:object atIndex:index];
    return array;
}

- (NSArray *)arrayByReplacingObjectAtIndex:(NSUInteger)index withObject:(id)object
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    array[index] = object;
    return array;
}

- (NSArray *)shuffledArray
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array shuffle];
    return array;
}

- (NSArray *)mappedArrayUsingBlock:(id (^)(id object))block
{
    if (block)
    {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
        for (id object in self)
        {
            id replacement = block(object);
            if (replacement) [array addObject:replacement];
        }
        return array;
    }
    return [NSArray arrayWithArray:self];
}

@end


@implementation NSMutableArray (ArrayUtils)

- (void)removeFirstObject
{
    if ([self count])
    {
        [self removeObjectAtIndex:0];
    }
}

- (void)shuffle
{
    for (NSInteger i = (NSInteger)[self count] - 1; i > 0; i--)
    {
        NSUInteger j = (NSUInteger)arc4random_uniform((NSUInteger)i + 1);
        [self exchangeObjectAtIndex:j withObjectAtIndex:(NSUInteger)i];
    }
}

@end
