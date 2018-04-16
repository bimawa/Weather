//
// Created by Maxim Bunkov on 4/9/18.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "WeatherService.h"


@implementation WeatherService {

}

- (NSURL *)weatherVideoFromCode:(NSNumber *)codeOfWeather {
  NSURL        *resultURL        = nil;
  NSDictionary *kCodesDictionary = @{
      @"200": @"https://media.gettyimages.com/videos/rainbow-and-lightning-video-id901187366",
      @"201": @"https://media.gettyimages.com/videos/heavy-rain-video-id505229595",
      @"202": @"https://media.gettyimages.com/videos/thunderstorm-and-rain-over-urban-landscape-video-id176592379",
      @"210": @"https://media.gettyimages.com/videos/lightning-storm-video-id864950678",
      @"211": @"https://media.gettyimages.com/videos/lightning-video-id176653597",
      @"212": @"https://media.gettyimages.com/videos/-video-id883181774",
      @"221": @"https://media.gettyimages.com/videos/dark-timelapse-storm-clouds-ragged-beneath-rotate-over-the-prairie-video-id139922372",
      @"230": @"https://media.gettyimages.com/videos/thunderstorm-video-id841036786",
      @"231": @"https://media.gettyimages.com/videos/lightning-above-the-forest-video-id819748180",
      @"232": @"https://media.gettyimages.com/videos/-video-id883191172",
      @"300": @"https://media.gettyimages.com/videos/raindrops-in-pool-video-id837632534",
      @"301": @"https://media.gettyimages.com/videos/nature-in-naples-video-id826623144",
      @"302": @"https://media.gettyimages.com/videos/street-lamp-in-rain-video-id507425687",
      @"310": @"https://media.gettyimages.com/videos/raindrops-falling-on-young-plant-closeup-video-id181846449",
      @"311": @"https://media.gettyimages.com/videos/focus-change-rice-paddy-in-the-rain-kumamoto-japan-video-id682454672",
      @"312": @"https://media.gettyimages.com/videos/heavy-rain-in-tropical-forest-sarapiqui-costa-rica-video-id692470585",
      @"313": @"https://media.gettyimages.com/videos/drops-dripping-down-the-glass-video-id173045688",
      @"314": @"https://media.gettyimages.com/videos/rain-hitting-broad-green-leaves-during-a-tropical-monsoon-video-id699017909",
      @"321": @"https://media.gettyimages.com/videos/white-orchid-in-shower-slow-motion-video-id665574780",
      @"500": @"https://media.gettyimages.com/videos/nature-in-naples-video-id826623144",
      @"501": @"https://media.gettyimages.com/videos/slow-motion-shot-of-raindrops-falling-onto-the-plains-of-the-video-id821849502",
      @"502": @"https://media.gettyimages.com/videos/medium-shot-of-rain-falling-outside-an-upperclass-home-video-id715281993",
      @"503": @"https://media.gettyimages.com/videos/rain-dance-woman-video-id508982352",
      @"504": @"https://media.gettyimages.com/videos/woman-twirling-in-the-rain-video-id460710771",
      @"511": @"https://media.gettyimages.com/videos/shot-of-freezing-rain-falling-on-icy-branches-tweed-ontario-canada-video-id486369165",
      @"520": @"https://media.gettyimages.com/videos/adult-woman-enjoying-in-the-rain-with-her-daughter-delhi-india-video-id872089618",
      @"521": @"https://media.gettyimages.com/videos/man-lashed-by-strong-wind-and-rain-as-typhoon-hato-approaches-hong-video-id840382556",
      @"522": @"https://media.gettyimages.com/videos/was-second-wettest-year-on-record-lib-tx-682012-newcastle-woman-with-video-id649955490",
      @"531": @"https://media.gettyimages.com/videos/girl-dancing-in-rain-and-splashing-in-puddle-lamy-new-mexico-usa-video-id101597251",
      @"600": @"https://media.gettyimages.com/videos/winter-loopable-video-id491321614",
      @"601": @"https://media.gettyimages.com/videos/snow-loopable-video-id859963398",
      @"602": @"https://media.gettyimages.com/videos/-video-id883153986",
      @"611": @"https://media.gettyimages.com/videos/bicycle-path-in-winter-video-id887163766",
      @"612": @"https://media.gettyimages.com/videos/winter-landscape-video-id889381212",
      @"615": @"https://media.gettyimages.com/videos/ferry-passes-under-the-brooklyn-bridge-as-it-makes-its-way-along-the-video-id936821454",
      @"616": @"https://media.gettyimages.com/videos/sun-shining-through-bare-forest-trees-snow-and-withered-foliage-on-video-id659599103",
      @"620": @"https://media.gettyimages.com/videos/girl-catching-snow-on-her-tongue-richmond-virginia-usa-video-id98073643",
      @"621": @"https://media.gettyimages.com/videos/frozen-harmony-loopable-video-id495631246",
      @"622": @"https://media.gettyimages.com/videos/an-american-flag-flies-over-an-island-as-ducks-swim-past-on-the-long-video-id901837186",
      @"701": @"https://media.gettyimages.com/videos/view-over-evergreen-tree-covering-mountain-range-with-low-hanging-video-id179623567",
      @"711": @"https://media.gettyimages.com/videos/beijing-residential-area-cityscape-in-air-pollution-day-to-night-video-id642715884",
      @"721": @"https://media.gettyimages.com/videos/stormy-mountain-with-firs-video-id113823580",
      @"731": @"https://media.gettyimages.com/videos/sand-blows-in-the-wind-in-desert-slow-motion-video-id681243920",
      @"741": @"https://media.gettyimages.com/videos/redwood-forest-reveal-aerial-shot-video-id855709250",
      @"751": @"https://media.gettyimages.com/videos/sand-storm-blows-over-dunes-in-the-desert-video-id699047979",
      @"761": @"https://media.gettyimages.com/videos/combine-leaves-cloud-of-dust-behind-video-id695645912",
      @"762": @"https://media.gettyimages.com/videos/kirishima-volcano-erupting-video-id522770362",
      @"771": @"https://media.gettyimages.com/videos/intense-wind-and-rain-batter-the-island-of-rota-as-typhoon-dolphin-video-id476129592",
      @"781": @"https://media.gettyimages.com/videos/hurricane-in-dark-sky-with-bright-horizon-4k-video-id840814098",
      @"800": @"https://media.gettyimages.com/videos/white-cirrostratus-clouds-in-blue-sky-video-id163190639",
      @"801": @"https://media.gettyimages.com/videos/relaxing-video-id880231612",
      @"802": @"https://media.gettyimages.com/videos/man-goes-crosscountry-skiing-slow-motion-video-id886926998",
      @"803": @"https://media.gettyimages.com/videos/western-sydney-sunset-timelapse-video-id915911214",
      @"804": @"https://media.gettyimages.com/videos/storm-clouds-at-sunset-video-id636618392",
      @"900":@"https://media.gettyimages.com/videos/huge-giant-extreme-lightning-storm-4k-video-id840795644",
      @"901":@"https://media.gettyimages.com/videos/palm-trees-thrash-violently-and-debris-flies-through-the-air-as-irma-video-id851353470",
      @"902":@"https://media.gettyimages.com/videos/slowly-rotating-cyclone-viewed-from-space-video-id495546819",
      @"903":@"https://media.gettyimages.com/videos/icicles-hang-from-a-frozen-elephant-fountain-on-february-27-2018-in-video-id925340244",
      @"904":@"https://media.gettyimages.com/videos/blazing-sun-glows-in-a-hazy-sky-video-id570506879",
      @"905":@"https://media.gettyimages.com/videos/stormy-sky-above-grass-blowing-on-wind-blenheim-marlborough-new-video-id84225981",
      @"906":@"https://media.gettyimages.com/videos/hail-and-rain-falling-on-wood-deck-boards-video-id485431185",
      @"951":@"https://media.gettyimages.com/videos/milford-sound-fiordland-new-zealand-video-id529496790",
      @"952":@"https://media.gettyimages.com/videos/sunlight-seen-through-branches-video-id481953611",
      @"953":@"https://media.gettyimages.com/videos/white-almond-blossoms-video-id648413682",
      @"954":@"https://media.gettyimages.com/videos/blossom-video-id102019987",
      @"955":@"https://media.gettyimages.com/videos/woman-enjoying-view-of-lake-on-a-windy-day-video-id846314168",
      @"956":@"https://media.gettyimages.com/videos/trail-running-sunset-landscape-video-id864482724",
      @"957":@"https://media.gettyimages.com/videos/zoom-out-of-palm-trees-showing-strong-winds-from-typhoon-blowing-video-id150962542",
      @"958":@"https://media.gettyimages.com/videos/violent-wind-and-storm-surge-lash-waterfront-in-hong-kong-as-typhoon-video-id840408098",
      @"959":@"https://media.gettyimages.com/videos/-video-id461017632",
      @"960":@"https://media.gettyimages.com/videos/video-background-supercell-thunderstorm-sea-storm-with-multiple-video-id91809142",
      @"961":@"https://media.gettyimages.com/videos/stormy-sea-waves-with-lightning-video-id513412114",
      @"962":@"https://media.gettyimages.com/videos/powerful-wind-and-flooding-storm-surge-hit-hong-kong-as-typhoon-hato-video-id841412640"
  };
  NSString     *urlStringByCode  = kCodesDictionary[codeOfWeather.stringValue];
  resultURL = [NSURL URLWithString:urlStringByCode];
  return resultURL;
}

@end