//
//  DVMPokemonController.m
//  PokedexObjC
//
//  Created by Julia Rodriguez on 7/2/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import "DVMPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon/";


@implementation DVMPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon *))completion
{
    // Step 1 - Create the URL from the base URL and search term
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    //print(finalURL)
    NSLog(@"%@", finalURL);
    // "%@" insert object here after , 
    
    
    // Step 2 - Start dataTask with completion
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Was there an error
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // Check the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        // Get the data
        if (data)
        {
            
            // 2 = allow fragments, &error = same NSError for everything
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            // If we made it here, have successfully parsed my JSON and should be able to complete with a Pokemon Object
            Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
    
    
}
@end
