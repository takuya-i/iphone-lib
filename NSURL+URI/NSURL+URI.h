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


/** Adnroid has Uri class and parse query easily.
 *  This class add queryParser to NSURL class
 */

#import <Foundation/Foundation.h>


// Add Category to NSURL class
// Two instance method and one property will be added.

@interface NSURL(URI)

//return all values from query string mutched at key
-(NSArray *)queryParameterSet:(NSString *)key;

//return value from query matched at key first.
-(NSString *)queryParameter:(NSString *)key;

//return URL string withput query 
@property (readonly, strong,getter=urlWithoutQuery) NSString *urlWithoutQuery;
@end
