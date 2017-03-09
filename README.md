### SimpleKeychain
A simple usage for KeyChain, Just like `NSUserDefaults` , not Keychain group , not complex use.

Methods as follows:

```
+(BOOL)setObject:(id)object forKey:(NSString *)key;

+(id)objectForKey:(NSString *)key;

+(BOOL)deleteItmeWith:(NSString*)key;

```

Set Item:

```
[SimpleKeychain setObject:@"value" forKey:@"key"];

```

Get Item:

```
[SimpleKeychain objectForKey:@"key"];

```

Delete Item:

```
[SimpleKeychain deleteItmeWith:@"key"];

```