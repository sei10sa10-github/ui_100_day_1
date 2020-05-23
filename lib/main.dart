import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _MyHome());
  }
}

class _MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<_MyHome> {
  int _selectedPromoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black38,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(16.0),
                      bottomRight: const Radius.circular(16.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Your',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Insipiration',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey.shade100,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black87,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Search you're looking for",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Promo Today',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                          itemCount: PromoImage.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return getPromoCard(context, index);
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage(PromoImage.list[_selectedPromoIndex])),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.1),
                              ],
                              begin: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.9,
                              ],
                              ),
                              ),
                              
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Best Design',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPromoCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPromoIndex = index;
        });
      },
      child: AspectRatio(
        aspectRatio: 2.76 / 3.0,
        child: Container(
          margin: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PromoImage.list[index]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.1),
                    ],
                    begin: Alignment.bottomRight,
                    stops: [
                      0.1,
                      0.9,
                    ])),
          ),
        ),
      ),
    );
  }
}

abstract class PromoImage {
  static const Map<int, String> list = {
    0: 'assets/images/one.jpg',
    1: 'assets/images/two.jpg',
    2: 'assets/images/three.jpg',
    3: 'assets/images/four.jpg',
  };
}
