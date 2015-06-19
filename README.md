# Vine Scrape Account Stats
[![Build Status](http://img.shields.io/travis/slang800/vine-scrape-account-stats.svg?style=flat-square)](https://travis-ci.org/slang800/vine-scrape-account-stats) [![NPM version](http://img.shields.io/npm/v/vine-scrape-account-stats.svg?style=flat-square)](https://www.npmjs.org/package/vine-scrape-account-stats) [![NPM license](http://img.shields.io/npm/l/vine-scrape-account-stats.svg?style=flat-square)](https://www.npmjs.org/package/vine-scrape-account-stats)

A tool for scraping public data from Vine, without needing to get permission from Vine. It scrapes the following fields:

- authoredPosts
- description
- followers
- following
- isExplicit
- isPrivate
- isVerified
- name
- posts
- totalLikedPosts
- totalLoops
- userId
- username

See `lib/response.schema.json` for further details.

## Example
### CLI
The CLI operates entirely over STDOUT, and will output the account stats as JSON.

```bash
$ vine-scrape-account-stats --id 969179904094908416
{"description":"","followers":3,"following":3,"isExplicit":false,"isPrivate":false,"isVerified":false,"name":"Sean Lang","totalLoops":30,"totalLikedPosts":14,"userId":"969179904094908416","username":"slang","authoredPosts":2,"posts":2}
$ vine-scrape-account-stats -u slang
{"description":"","followers":3,"following":3,"isExplicit":false,"isPrivate":false,"isVerified":false,"name":"Sean Lang","totalLoops":30,"totalLikedPosts":14,"userId":"969179904094908416","username":"slang","authoredPosts":2,"posts":2}
```

### JavaScript Module
The following example is in CoffeeScript.

```coffee
{getAccountStats} = require 'vine-scrape-account-stats'

getAccountStats(userId: '969179904094908416').then((account) ->
  console.log "#{account.username} has #{account.followers} followers."
)
```

The following example is the same as the last one, but in JavaScript.

```js
var getAccountStats = require('vine-scrape-account-stats').getAccountStats;

getAccountStats(userId: '969179904094908416').then(function(account) {
  console.log(account.username + " has " + account.followers + " followers.");
});
```

## Why?
Vine doesn't provide an open, structured, and machine readable API, so, we're forced to scrape their user-facing site.

## Caveats
- This is probably against the Vine TOS, so don't use it if that sort of thing worries you.
- Whenever Vine updates certain parts of their front-end this scraper will need to be updated to support the new API.
- You can't scrape protected accounts (cause it's not public duh).
