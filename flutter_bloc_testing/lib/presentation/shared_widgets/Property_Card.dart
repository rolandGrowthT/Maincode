import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc_testing/models/Space_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyCard extends StatefulWidget {
  final SpaceModel space;

  PropertyCard({required this.space});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _currentIndex = 0;
  }

  // int currentIndex = Provider.of<Property_provider>(context).Selecteddot;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: 400,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  itemCount: widget.space.spaceImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final imageUrl = widget.space.spaceImages[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.space.spaceImages.length,
                  (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.fromLTRB(5, 220, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.white // Active dot color
                            : Colors.grey, // Inactive dot color
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.space.propertyName,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MontserratRegular',
                  color: Color(0xFF607385)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.space.spaceTitle,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratRegular',
                      color: Color(0xFF3C4955)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Icon-16x-Star.svg',
                        color: Colors.orange,
                      ),
                      SizedBox(width: 4),
                      Text(widget.space.spaceRating.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.space.spaceDescription,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF607385)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                    minimumSize: Size(0, 35),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Starting Price',
                        style: TextStyle(
                            fontSize: 10, fontFamily: 'MontserratRegular'),
                      ),
                      Text(
                        '\$${widget.space.spacePrice}/night',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'MontserratMedium'),
                      ),
                    ],
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
