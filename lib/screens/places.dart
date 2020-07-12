import 'package:flutter/material.dart';
import 'package:seeker/FadeAnimation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: Place(),
  )
);

class Place extends StatefulWidget {
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 3;

  void _onScroll() {
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  } 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/del.jpg',
            title: 'Delhi,India',
            description: "Delhi is the capital city of India and is regarded as the heart of the nation. The city is popular for its enriched culture and heritage. The city hosts some famous historical monuments and is developing with the passing of time. There are many beautiful gardens in the city, and busy city life that provide opportunities to walk leisurely in the midst of greenery."
          ),
          makePage(
            page: 2,
            image: 'assets/ny.jpg',
            title: 'New York, USA',
            description: "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park."
          ),
          makePage(
            page: 3,
            image: 'assets/aus.jpg',
            title: 'Canberra, Australia',
            description: "Canberra is the capital city of Australia. Founded following the federation of the colonies of Australia as the seat of government for the new nation, it is Australia's largest inland city and the eighth-largest city overall."
          ),
          makePage(
            page: 4,
            image: 'assets/mos.jpg',
            title: 'Moscow,Russia',
            description: "Moscow, on the Moskva River in western Russia, is the nation’s cosmopolitan capital. In its historic core is the Kremlin, a complex that’s home to the president and tsarist treasures in the Armoury. Outside its walls is Red Square, Russia's symbolic center. It's home to Lenin’s Mausoleum, the State Historical Museum's comprehensive collection and St. Basil’s Cathedral, known for its colorful, onion-shaped domes."
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(2, Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1,
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 50, height: 1.2, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(1.5, Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.white, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.white, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.white, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.white, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.white, size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2, Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(2.5, Text('READ MORE', style: TextStyle(color: Colors.white),)),
                    SizedBox(height: 30,),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}