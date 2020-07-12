import 'package:flutter/material.dart';
import 'package:seeker/screens/FactsAboutYou.dart';
import 'package:seeker/screens/FeedBack.dart';
import 'package:seeker/screens/ImgCap.dart';
import 'package:seeker/screens/MyAnotherScreen.dart';
import 'package:seeker/screens/Mylocation.dart';
import 'package:seeker/screens/PlacesNearbyYou.dart';
import 'package:seeker/screens/PlacesToVisit.dart';
import 'package:seeker/screens/Profile.dart';
import 'package:seeker/screens/SearchByPic.dart';
import 'package:seeker/screens/VisitedPlaces.dart';
import 'package:seeker/screens/some.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243,1),
      appBar: AppBar(
        title: Text("SEEKER", style: Theme.of(context).textTheme.title.copyWith(
          
          color: Colors.black54
        ),),
        centerTitle: true,
        
        backgroundColor: Color.fromRGBO(244, 243, 243,1),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.location_on), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
          }, color: Colors.black54,)
        ],
        
        
      ),

      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Seeker"),
              accountEmail: Text("Seek the places"),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.location_searching,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.black26),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyMap()));
              },
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Where am I ?"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageCapture()));
              },
              child: ListTile(
                leading: Icon(Icons.camera),
                title: Text("Search by pic"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlacesNearBy()));
              },
              child: ListTile(
                leading: Icon(Icons.explore),
                title: Text("Hotels near you"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FactsAboutYou()));
              },
              child: ListTile(
                leading: Icon(Icons.find_in_page),
                title: Text("Facts about you"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Visitedplaces()));
              },
              child: ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Visited Places"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => demo()));
              },
              child: ListTile(
                leading: Icon(Icons.format_align_left),
                title: Text("Places to visit"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: ListTile(
                leading: Icon(Icons.people),
                title: Text("Profile"),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedBack(),),);
              },
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text("Send us a feedback"),
              ),
            ),
          ],
        ),
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30))
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Travel's got it ",
                      style: TextStyle(color: Colors.black, fontSize: 25),

                    ),
                    SizedBox(
                      height: 5,
                      
                    ),
                    Text(
                      "All",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search you're looking for",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    SizedBox(height: 10,
                     ),
                  ],
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                    "Places you might like..",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          promoCard("assets/one.jpg"),
                          promoCard("assets/two.jpg"),
                          promoCard("assets/three.jpg"),
                          promoCard("assets/four.jpg"),
                          promoCard("assets/five.jpg"),
                          promoCard("assets/six.jpg"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/three.jpg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}


