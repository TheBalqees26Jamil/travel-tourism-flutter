import 'package:flutter/material.dart';
import 'app_common.dart';

// ─────────────────────────────────────
class Place {
  final String name;
  final String location;
  final String category;
  final String image;
  final int price;
  final double rating;
  final String reviews;

  const Place({
    required this.name,
    required this.location,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
  });
}

const String _u = 'https://images.unsplash.com/photo-';

const List<Place> places = [
  Place(
    name: 'Bora Bora Retreat',
    location: 'French Polynesia',
    category: 'Hotels',
    image: '${_u}1589197331516-4d84b72ebde3?w=800&q=80',
    price: 420,
    rating: 4.8,
    reviews: '2.3k',
  ),
  Place(
    name: 'Santorini Blue Suites',
    location: 'Santorini, Greece',
    category: 'Hotels',
    image: '${_u}1566073771259-6a8506099945?w=800&q=80',
    price: 380,
    rating: 4.9,
    reviews: '1.8k',
  ),
  Place(
    name: 'Maldives Sand Resort',
    location: 'Maldives',
    category: 'Hotels',
    image: '${_u}1571896349842-33c89424de2d?w=800&q=80',
    price: 510,
    rating: 4.7,
    reviews: '3.1k',
  ),
  Place(
    name: 'Tuscany Hills Villa',
    location: 'Tuscany, Italy',
    category: 'Villa',
    image: '${_u}1512917774080-9991f1c4c750?w=800&q=80',
    price: 290,
    rating: 4.6,
    reviews: '940',
  ),
  Place(
    name: 'Bali Jungle Villa',
    location: 'Ubud, Bali',
    category: 'Villa',
    image: '${_u}1520250497591-112f2f40a3f4?w=800&q=80',
    price: 340,
    rating: 4.8,
    reviews: '1.2k',
  ),
  Place(
    name: 'Malibu Beach Villa',
    location: 'California, USA',
    category: 'Villa',
    image: '${_u}1600596542815-ffad4c1539a9?w=800&q=80',
    price: 620,
    rating: 4.9,
    reviews: '780',
  ),
];

const String avatarUrl = '${_u}1507003211169-0a1dd7228f2d?w=200&q=80';

// ────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _category = 'Hotels';
  int _navIndex = 0;
  final Set<String> _favorites = {};
  final PageController _pageController = PageController(viewportFraction: 0.92);

  List<Place> get _filtered =>
      places.where((p) => p.category == _category).toList();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectCategory(String c) {
    setState(() => _category = c);
    if (_pageController.hasClients) _pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFE8DA), Color(0xFFEBDDF6), Color(0xFFD8ECF7)],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SafeArea(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildHelloCard(),
                  _buildSectionTitle(),
                  Expanded(child: _buildPlaces()),
                  _buildBottomNav(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ──
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: const SizedBox(
              width: 46,
              height: 46,
              child: NetImage(avatarUrl),
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Location',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Icon(Icons.keyboard_arrow_down,
                      size: 16, color: Colors.black54),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  SizedBox(width: 2),
                  Text('San Francisco',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
    );
  }

  // ────
  Widget _buildHelloCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hello, Jozzy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          const Text('Discover luxury stays, crafted for you',
              style: TextStyle(fontSize: 12.5, color: Colors.black54)),
          const SizedBox(height: 14),

          //
          Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF9C7BFF), Color(0xFF5B3DF5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask anything...',
                      hintStyle: TextStyle(color: Colors.black38),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          //
          Row(
            children: [
              _categoryChip('Hotels', Icons.bed_rounded),
              _categoryChip('Flights', Icons.flight_rounded),
              _categoryChip('Car', Icons.directions_car_rounded),
              _categoryChip('Villa', Icons.villa_rounded),
            ],
          ),
        ],
      ),
    );
  }

  Widget _categoryChip(String label, IconData icon) {
    final selected = _category == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectCategory(label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 62,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 20, color: selected ? Colors.white : Colors.black87),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(22, 18, 22, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Popular Places',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text('See all',
              style: TextStyle(fontSize: 12.5, color: Colors.black54)),
        ],
      ),
    );
  }

  // ────
  Widget _buildPlaces() {
    final items = _filtered;
    if (items.isEmpty) {
      return Center(
        child: Text('$_category are coming soon',
            style: const TextStyle(color: Colors.black54)),
      );
    }
    return PageView.builder(
      controller: _pageController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final place = items[index];
        final isFav = _favorites.contains(place.name);
        return Padding(
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
          child: _PlaceCard(
            place: place,
            isFavorite: isFav,
            onFavorite: () => setState(() {
              isFav ? _favorites.remove(place.name) : _favorites.add(place.name);
            }),
          ),
        );
      },
    );
  }

  // ───
  Widget _buildBottomNav() {
    const icons = [
      Icons.home_rounded,
      Icons.calendar_month_rounded,
      Icons.explore_rounded,
      Icons.person_rounded,
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(60, 4, 60, 14),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (i) {
          final selected = i == _navIndex;
          return GestureDetector(
            onTap: () => setState(() => _navIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: selected ? Colors.black : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[i],
                size: 22,
                color: selected ? Colors.white : Colors.black54,
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ────────────────────────────────────────────
class _PlaceCard extends StatelessWidget {
  final Place place;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const _PlaceCard({
    required this.place,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          NetImage(place.image),

          
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Color(0x00000000), Color(0xAA000000)],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star_rounded,
                      size: 15, color: Color(0xFFF6B100)),
                  const SizedBox(width: 3),
                  Text('${place.rating} (${place.reviews})',
                      style: const TextStyle(
                          fontSize: 11.5, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),

          
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: onFavorite,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),

          
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.white70),
                          const SizedBox(width: 3),
                          Text(place.location,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        place.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text.rich(
                        TextSpan(
                          text: '\$${place.price}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                          children: const [
                            TextSpan(
                              text: ' /night',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booking ${place.name}...'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}