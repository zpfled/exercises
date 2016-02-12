### Use the reverb api:

https://reverb.com/api

### You will be hitting the listings endpoint

https://reverb.com/api/listings

### The challenge is as follows:

Create a page that displays the most recent listings from the Reverb API by polling the API every 15 seconds. Display the listings on the screen in some type of tiled format. It's up to you how to format the tiles.

When new listings appear in the stream, randomly select a few of the tiles and "flip them" (using CSS3 animation) so that the backside of the tile displays the newly arrived listings.

In order to poll a specific number of listings, say 50, use the per_page param:

https://reverb.com/api/listings?per_page=50

Restrictions:

* you may not use any javascript frameworks except for jquery (no ember/angular/etc)
* you will be judged on the organization of the code - is it easy to maintain? Prefer clear code over clever code.
* you must provide jasmine or mocha unit tests for your code. Stub out the ajax calls as needed.

Bonuses:

* Make it look visually appealing - how far you take this is up to you
