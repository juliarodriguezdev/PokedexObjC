//
//  Pokemon.m
//  PokedexObjC
//
//  Created by Julia Rodriguez on 7/2/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)indentifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self != nil) {
        // self.pokemonName = name, _ = self
        _pokemonName = name;
        _identifier = indentifier;
        _abilities = abilities;
    }
    return self;
}


@end
// extenstion
@implementation Pokemon (JSONConvertable)

// Top level dictionary
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary //C
{
    // type objName = Key in Dictionary
    NSString *name = topLevelDictionary[@"name"];
    // let name = dictionary["name"] as? String
    
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    
    NSArray *abilitiesDict = topLevelDictionary[@"abilities"]; //B
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    // let abilities: [String] = []
    
    for (NSDictionary *dictionary in abilitiesDict) //B
    {
        NSDictionary *abilityDict = dictionary[@"ability"]; //A
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    
    return[self initWithPokemonName:name identifier:identifier abilities:abilities];
    
}

@end
