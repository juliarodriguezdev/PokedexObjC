//
//  Pokemon.h
//  PokedexObjC
//
//  Created by Julia Rodriguez on 7/2/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Pokemon Class Name of type NSObject
@interface Pokemon : NSObject

// read only = let
// * for classes
// * property name 
@property (nonatomic, copy, readonly) NSString *pokemonName;
// Swift Version:
// let pokemonName: String
// string add - copy

@property (nonatomic, readonly) NSInteger identifier;
// let identifier : Int
// No * because its primitive

@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

//initializer
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)indentifier
                          abilities:(NSArray<NSString *> *)abilities;
/*
 
 init(name: String, identifier: Int, abilities: [String]) {
 
 }
 
 */

@end

// Extension
@interface Pokemon (JSONConvertable)

// any object = id
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
// Swift version
// init(withDictionary: [String:Any]) { }
// Dictionary = [String:Any]

@end

NS_ASSUME_NONNULL_END
