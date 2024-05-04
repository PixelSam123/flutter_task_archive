import 'package:flutter/material.dart';
import 'package:flutter_task_archive/types.dart';

final List<Continent> continents = [
  Continent(
    name: 'Asia',
    locations: [
      const Location(
        name: 'Tajmahal, India',
        startingPrice: 2000,
        picturePath: 'assets/tajmahal.png',
      ),
    ],
  ),
  Continent(
    name: 'Oceania',
    locations: [],
  ),
  Continent(
    name: 'America',
    locations: [],
  ),
  Continent(
    name: 'Europe',
    locations: [
      const Location(
        name: 'Paris, France',
        startingPrice: 1200,
        picturePath: 'assets/paris.png',
      ),
    ],
  ),
];

final List<Location> allLocations = continents.expand((continent) {
  return continent.locations;
}).toList();

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          primary: const Color(0xFFFC465D),
          tertiary: const Color(0xFFA0A0A0),
          tertiaryContainer: const Color(0xFFF4F4F6),
          surface: const Color(0xFFFFFFFF),
        ),
        disabledColor: const Color(0xFFD2D2D2),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      child: const DiscoverPageContent(),
    );
  }
}

class DiscoverPageContent extends StatelessWidget {
  const DiscoverPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 384.0),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            clipBehavior: Clip.none,
            scrolledUnderElevation: 0.0,
            actions: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(63),
                      blurRadius: 16.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0.0, 12.0),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/pfp.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
            ],
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _Body()),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    const sidePadding = EdgeInsets.symmetric(horizontal: 16.0);

    return ListView(
      children: [
        const SizedBox(height: 24.0),
        Padding(
          padding: sidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                'Discover',
              ),
              const SizedBox(height: 4.0),
              Text(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                'Explore the best places in the world!',
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(9999.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          'Search your trip',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            size: 16.0,
                            color: Theme.of(context).colorScheme.onPrimary,
                            Icons.search,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ContinentSelect(
                    continent: Continent(
                      name: 'All',
                      locations: [],
                    ),
                    isActive: true,
                  ),
                  ...continents.map((continent) {
                    return _ContinentSelect(continent: continent);
                  }),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        SizedBox(
          height: 210.0,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allLocations.length,
            itemBuilder: (_, index) {
              return Row(children: [
                const SizedBox(width: 16.0),
                _Location(location: allLocations[index]),
                SizedBox(width: index == allLocations.length - 1 ? 16.0 : 0.0),
              ]);
            },
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: sidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                'Popular Categories',
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Category(name: 'Trips', picturePath: 'assets/trips.png'),
                  _Category(name: 'Hotel', picturePath: 'assets/hotel.png'),
                  _Category(
                    name: 'Transport',
                    picturePath: 'assets/transport.png',
                  ),
                  _Category(name: 'Events', picturePath: 'assets/events.png'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48.0,
        vertical: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Theme.of(context).colorScheme.onPrimary,
                    Icons.home_rounded,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    'Home',
                  ),
                ],
              ),
            ),
          ),
          ...[
            Icons.explore,
            Icons.notifications,
            Icons.favorite
          ].map((icon) => Icon(icon, color: Theme.of(context).disabledColor)),
        ],
      ),
    );
  }
}

class _ContinentSelect extends StatelessWidget {
  final Continent continent;
  final bool isActive;

  const _ContinentSelect({
    required this.continent,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          continent.name,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(height: 2.0),
        Container(
          width: 4.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  final Location location;

  const _Location({required this.location});

  @override
  Widget build(BuildContext context) {
    const textShadows = [
      Shadow(color: Colors.black, blurRadius: 4.0),
    ];

    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(location.picturePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                        shadows: textShadows,
                      ),
                      location.name,
                    ),
                    Text(
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                        shadows: textShadows,
                      ),
                      'Starting at \$${location.startingPrice}',
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      size: 16.0,
                      color: Theme.of(context).colorScheme.primary,
                      Icons.favorite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final String name;
  final String picturePath;

  const _Category({
    required this.name,
    required this.picturePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            width: 48.0,
            height: 48.0,
            fit: BoxFit.cover,
            picturePath,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          name,
        ),
      ],
    );
  }
}
