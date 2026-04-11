'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e97a9252cf703610ac9cc2b346822082",
"assets/AssetManifest.bin.json": "3da8debed553393cb03b630b17cffab0",
"assets/AssetManifest.json": "a8007d962ad262992456e1337f07c845",
"assets/assets/fonts/Beiruti/Beiruti-Black.ttf": "5b5c2d5365e27dcb5925b0854c59a5c4",
"assets/assets/fonts/Beiruti/Beiruti-Bold.ttf": "4ffe786a8520e3ec39e451dec5f34a91",
"assets/assets/fonts/Beiruti/Beiruti-ExtraBold.ttf": "3a4d04195569924720f64eca21f58ba1",
"assets/assets/fonts/Beiruti/Beiruti-Medium.ttf": "02211496500f43a5960fc723faebb232",
"assets/assets/fonts/Beiruti/Beiruti-Regular.ttf": "29e6d1301b2b6866139d886c7ec562d2",
"assets/assets/fonts/Beiruti/Beiruti-SemiBold.ttf": "bf1633492bfdb60a85d4b1601b3fcaa6",
"assets/assets/images/hero_image.png": "93ab537ecf3b0c0f4c5cccd49731f994",
"assets/assets/images/main.jpg": "53a9595eff06d47eb68eaaa8c4c9715c",
"assets/assets/images/main_2.jpg": "ff81e299a316f6677a6bf5a1bd42d360",
"assets/assets/images/mission.png": "449e5045007798a4d02ac90b74d16e7a",
"assets/assets/images/rooms/room_1.jpg": "1f71345ebf8135bc13b9bae6f04484cf",
"assets/assets/images/rooms/room_2.jpg": "5b0bd688eeb542fac4eb3fd1611f2f5c",
"assets/assets/images/rooms/room_3.jpg": "8ab281db7829e59a8cce0604e7ec87b8",
"assets/assets/images/rooms/room_4.jpg": "528732d8d87ae653a423698b40d0085e",
"assets/assets/images/rooms/room_5.jpg": "0f16f7b15610b8b631618f0fc126cbcd",
"assets/assets/images/rooms/room_6.jpg": "1439ed44ede312814e3b0e7029ff995d",
"assets/assets/images/rooms/room_7.jpg": "85a3a14983441c1f1fe60fb7105b92d3",
"assets/assets/images/rooms/room_8.jpg": "e1a964318b76780c410592c44305b0df",
"assets/assets/images/rooms_hero.jpg": "62ec5ff27c3e496b00d9425e1d3363a4",
"assets/assets/images/venues/breakfast_terrace.jpg": "336fe4b5dff8bda0f67c55792779281a",
"assets/assets/images/venues/cafe_counter.jpg": "7ead346d21b96a3c3127e660d309d5c4",
"assets/assets/images/venues/coworking_corner.jpg": "454e5663a630cd43991c572a053bf9d1",
"assets/assets/images/venues/industrial_lounge.jpg": "e12696293c16317c8ce6935d179811e1",
"assets/assets/images/venues/main_lobby.jpg": "d4f6a9f5487a4f319d3294f121b971cf",
"assets/assets/images/venues/marble_lounge.jpg": "ef323d16f1bba476578b96cf1cfd00ee",
"assets/assets/images/venues/palm_terrace.jpg": "d3a45c4cdcfff6b5f84a3a5e5ad505af",
"assets/assets/images/venues/pool_swimming.jpg": "01e9e54f36b6f0e11d0e6cb65b3fb320",
"assets/assets/images/venues/royal_entrance.jpg": "142e1a812db897c560e94f2307e22d4f",
"assets/assets/images/venues_hero.jpg": "162f7c32c265cd8a9ffac734b161a537",
"assets/assets/images/vision.png": "459ae608502025efdd904f7f2e4d3696",
"assets/FontManifest.json": "719b3c85a30150a9132ac3cbd8f5e08b",
"assets/fonts/MaterialIcons-Regular.otf": "3cd9f5fae8f71ecbf10c8aeabd750bcd",
"assets/NOTICES": "4519f59951d7d9f1088bb4e7d2010f54",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "0084f7095b8551a87d1112d1be0f692b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0dc91ddef378017935def92150cca41d",
"/": "0dc91ddef378017935def92150cca41d",
"main.dart.js": "d5a0121aefbd48a89b659868c1b630d9",
"manifest.json": "31159a73473109addc98327098f2d2b0",
"version.json": "3b87be1db89893a3234423d1d101f13f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
