Purpose
--------------

ArrayUtils is a collection of category methods that extend NSArray with a few missing methods that make certain array manipulations easier and more concise.


Supported OS & SDK Versions
-----------------------------

* Supported build target - iOS 7.0 / Mac OS 10.9 (Xcode 5.0, Apple LLVM compiler 5.0)
* Earliest supported deployment target - iOS 6.0 / Mac OS 10.7
* Earliest compatible deployment target - iOS 4.3 / Mac OS 10.6

NOTE: 'Supported' means that the library has been tested with this version. 'Compatible' means that the library should work on this iOS version (i.e. it doesn't rely on any unavailable SDK features) but is no longer being tested for compatibility and may require tweaking or bug fixes to run correctly.


ARC Compatibility
------------------

ArrayUtils works with both ARC and non-ARC projects. There is no need to exclude ArrayUtils files from the ARC validation process or to convert ArrayUtils using the ARC conversion tool.


Thread Safety
--------------

In general, NSArray is thread safe and NSMutableArray isn't. ArrayUtils does not do anything to change that. You can safely call the ArrayUtils methods on an NSArray instance from multiple threads, but doing so on an NSMutableArray will have unpredictable results.


Installation
--------------

To use the ArrayUtils categories in an app, just drag the ArrayUtils.h and ArrayUtils.m files (demo files and assets are not needed) into your project and import the header file into any class where you wish to make use of the ArrayUtils functionality, or include it in your prefix.pch file to make it available globally within your project.


NSArray Extension Methods
----------------------------

ArrayUtils extends NSArray with the following methods:

    - (id)firstObject;
    
Returns the first object in the array, or nil if the array is empty.
    
    - (NSArray *)arrayByRemovingObject:(id)object;
    
Returns a copy of the array with the specified object removed.
    
    - (NSArray *)arrayByRemovingObjectAtIndex:(NSUInteger)index;
    
Returns a copy of the array with the object at the specified index removed.
    
    - (NSArray *)arrayByRemovingLastObject;
    
Returns a copy of the array with the last object removed. Does nothing if the array is empty.
    
    - (NSArray *)arrayByRemovingFirstObject;
    
Returns a copy of the array with the first object removed. Does nothing if the array is empty.
    
    - (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index;
    
Returns a copy of the array with the specified object inserted at the specified index.
    
    - (NSArray *)arrayByReplacingObjectAtIndex:(NSUInteger)index withObject:(id)object;
    
Returns a copy of the array with the object at the specified index replaced by the specified object.

    - (NSArray *)shuffledArray

Returns a copy of the array with the objects shuffles randomly using arc4random.

    - (NSArray *)mappedArrayUsingBlock:(id (^)(id object))block

Returns a new array formed by performing the specified block on each element in the current array, and returning the result. If the block returns nil for any element, it will be omitted from the resultant array. If the block argument is nil, an identical copy of the original array will be returned.
    
    - (NSArray *)reversedArray;

Returns a copy of the array with the object order reversed.

    - (NSArray *)arrayByMergingObjectsFromArray:(NSArray *)array;

Returns an array containing all objects from both arrays that are not found in the other (i.e the union of the two arrays). If either the original or supplied arrays already contain duplicates, these will not be removed in the merge process. You can use the `uniqueObjects` method to ensure that an array does not contain duplicates.

    - (NSArray *)objectsInCommonWithArray:(NSArray *)array;

Returns a copy of the array with only the common elements between itself and the supplied array (i.e the intersection of the two arrays).

    - (NSArray *)uniqueObjects;
    
Returns an array containing only first occurence of each unique object in the array. The order is not affected.


NSMutableArray Extension Methods
---------------------------------

ArrayUtils extends NSMutableArray with the following methods:

    - (void)removeFirstObject;
    
Removes the first object from the array. Does nothing if the array is empty.

    - (void)shuffle;
    
Shuffles the array randomly using arc4random.

    - (void)reverse;

Reverses the order of the array elements.

    - (void)mergeObjectsFromArray:(NSArray *)array;

Appends any objects from supplied array that are not already present in the array. If either the original or supplied arrays already contain duplicates, these will not be removed in the merge process. You can use the `removeDuplicateObjects` method to ensure that the array does not contain duplicates.

    - (void)removeDuplicateObjects;
    
Removes all but the first occurence of each unique object in the array. The order is not affected.