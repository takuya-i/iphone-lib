/*
 * Copyright 2012 at Takuya Inoue
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */

#import "NSURL+URI.h"

@implementation NSURL(URI)

-(NSArray *)queryParameterSet:(NSString *)key
{
    NSString * query = self.query;
    NSMutableArray *params = [[NSMutableArray alloc] init];
    for (NSString *param in [query  componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        
        //non-value
        if([elts count] < 2) continue;
        
        [params addObject:[elts objectAtIndex:1]];
    }
    return params;
}

-(NSString *)queryParameter:(NSString *)key
{
    NSString * ret = nil;
    NSString * query = self.query;
    for (NSString *param in [query  componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        
        //non-value
        if([elts count] < 2) continue;
        
        if([[elts objectAtIndex:0]isEqualToString:key]) {
            ret = [elts objectAtIndex:0]; 
        }
        
    }
    return ret;  
}

-(NSString *)urlWithoutQuery 
{
    return [NSString stringWithFormat:@"%@://%@%@",self.scheme,self.host, self.path];

}

@end
