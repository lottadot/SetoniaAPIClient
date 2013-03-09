SetoniaAPIClient
=====

This small project is an API Client for [Setonia](http://setonia.com).

## Why?

Short version: A Quick AFNetworking-based API project with a non-standard JSON API.

Long version:

This started out because I couldn't tell what Setonia was, nor what data it was returning. To it's credit, Setonia advertises an API. I decided to whip up a quick iPhone app that would query their API, so I could see what type of information were responding with.

Are there easier ways? Sure. But not as fun :)

This quickly branched into a number of "experiments":
1. A workspace with multiple projects using Cocopods (failed: I couldn't get it to work. If you venture into the very early commits, you'll see the Podfile and my attempts at getting it to work, until I finally gave up. If you go look at the Cocoapods project there are existing issues related to this. Read there.)
2. Using AFNetworking with an APIClient not so tightly-coupled with ViewControllers. Hence the [LDTSetoniaDataManager](https://github.com/lottadot/SetoniaAPIClient/blob/master/LDTSetoniaExample/LDTSetoniaExample/Classes/DataManager/LDTSetoniaDataManager.h) class. However, I deem this is a partial failure, because [LDTSetoniaDataManager](https://github.com/lottadot/SetoniaAPIClient/blob/master/LDTSetoniaExample/LDTSetoniaExample/Classes/Controllers/ProductDetail/LDTProductDetailViewController.h) eventually uses `setImageWithURL` from [UIImageView+AFNetworking](https://github.com/AFNetworking/AFNetworking/blob/master/AFNetworking/UIImageView%2BAFNetworking.h#L43). The view controller is able to "cheat" and use AFNetworking because AF's already linked into the LDTSetoniaAPIClient static library. I started with a imageViewForProduct:product method in the DataManager class, but that didn't work for whatever reason. And I've got to get busy with other things so this is shelved for a while. Pull requests welcome. :)
3. Using AFNetworking with a malformed-service. I've run into this a few times, and each time, it's a pain in the ass. It's not AFNetworking's fault, it's the people who don't adhere to standards who are coding such services. The Setonia service returns JSON, but doesn't return valid typification. It returns "text/html". AFNetworking expects "application/json".

Why is this a problem? Without the proper return type, AFNetworking won't automatically `NSJSONSerialization` the data received.

Why is this a problem? I throws people who are new to a framework such as AFNetworking for a spin.

By venturing into AFNetworking's innerds, one can subclass such classes as `AFJSONRequestOperation` and attempt to encouraged AFNetworking accept and process JSON not transmitted to it as JSON. I left in the `LDTSetoniaJSONRequestOperation`, `AFHTTPClient+SetoniaUtil` and `NSMutableURLRequest+SetoniaUtil` classes so people can see where I was heading with this. I'm not sure if it's the "right" approach. However, I ran out of time, so rather then use that approach I simply do my own `NSJSONSerialization` in `getPath`'s success block. I do think this is cheating. The correct way to do this would be to adjust enough that AFNetworking will return the data received from the API as JSON in `getPath`'s succes block. Hopefully I'll return to this and finish it in that regard. Pull requests welcome.

## Does it work?

Yes, it works. The APIClient works. The Demo iPhone app works. The API Static Library will let you search (using blocks FTW!). The demo app will show you results, product images, product title. The example app doesn't show you everything related to product, though the [Product Model](https://github.com/lottadot/SetoniaAPIClient/blob/master/LDTSetoniaExample/LDTSetoniaExample/Classes/Models/Product.h) is complete as of 2013-03-09.

## What's in shiny box?

This contains an Xcode Workspace. The workspace contains two projects; a demo application and the LDTSetoniaAPIClient Static Library project. Use LDTSetoniaAPIClient Static Library project in your own project if you want to pull from Setonia. (Drag it in, or reference this as a git submodule to your own project).

## Installation

Clone the repository.
Be sure to update git submodules (ie "git submodule update --init --recursive")

## Contact

* [@lottadot](https://twitter.com/lottadot) on Twitter
* [@lottadot](https://github.com/lottadot) on Github
* [@lottadot](https://alpha.app.net/lottadot) on App.Net

* <a href="mailTo:shane@lottadot.com">shane [at] lottadot [dot] com</a>

## License

SetoniaAPIClient is a work from Shane Zatezalo under the MIT license. See the [license doc](https://github.com/lottadot/SetoniaAPIClient/blob/master/LICENSE) for details.

