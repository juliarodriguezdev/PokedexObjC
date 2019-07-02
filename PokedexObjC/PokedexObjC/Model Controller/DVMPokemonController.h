//
//  DVMPokemonController.h
//  PokedexObjC
//
//  Created by Julia Rodriguez on 7/2/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"


@interface DVMPokemonController : NSObject

// void will return it if fails, ^ = block
+(void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^) (Pokemon *))completion;
// static func fetchPokemon(for searchTerm: String, completion:((Pokemon?) -> (void))

@end

