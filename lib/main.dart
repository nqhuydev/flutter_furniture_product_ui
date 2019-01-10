import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Screen',
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'Montserrat'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _photoIndex = 0;
  List<String> _photos = [
    'assets/otto2.jpeg',
    'assets/otto3.jpg',
    'assets/otto4.jpg',
    'assets/otto5.jpg'
  ];

  void _setPreviousImage() {
    setState(() {
      _photoIndex = _photoIndex > 0 ? _photoIndex - 1 : 0;
    });
  }

  void _setNextImage() {
    setState(() {
      _photoIndex =
          _photoIndex < _photos.length - 1 ? _photoIndex + 1 : _photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Header
              new Stack(
                children: <Widget>[
                  //Slide Image
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    child: GestureDetector(
                      onTap: () {},
                      child:
                          Image.asset(_photos[_photoIndex], fit: BoxFit.cover),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 280,
                          color: Colors.transparent,
                        ),
                        onTap: _setPreviousImage,
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 280,
                          color: Colors.transparent,
                        ),
                        onTap: _setNextImage,
                      ),
                    ],
                  ),

                  //Dots
                  new Column(
                    children: <Widget>[
                      SizedBox(height: 250),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _listDots(),
                        ),
                      ),
                    ],
                  ),
                  //actionbar
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                        Expanded(child: SizedBox()),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Icon(Icons.favorite,
                                color: Colors.red, size: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Alcide Number: 9292x', style: TextStyle(fontSize: 15)),
                    SizedBox(height: 20),
                    Text('Ghế bọc đệm - Sofa', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Text(
                              'Scandinavian small size double sofa / imported full leather /Dale Italia oil wax leather black',
                              style: TextStyle(fontSize: 12, color: Colors.grey.withOpacity(0.8))),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Text('\$456', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('COLOR', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        _itemColor(
                          color: Colors.grey
                        ),
                        _itemColor(
                            color: Colors.grey.withOpacity(0.8)
                        ),
                        _itemColor(
                            color: Colors.grey.withOpacity(0.4)
                        ),
                        _itemColor(
                            color: Colors.grey.withOpacity(0.2)
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('MATERIAL', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _itemMaterial(
                              icon: Icons.time_to_leave,
                              text: 'x30%',
                            ),
                            _itemMaterial(
                              icon: Icons.timer,
                              text: 'x50%',
                            ),
                            _itemMaterial(
                              icon: Icons.monetization_on,
                              text: 'x80%',
                            )
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  List<Widget> _listDots() {
    List<Widget> list = new List();
    for (int i = 0; i < _photos.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: i == _photoIndex
                    ? Colors.yellow
                    : Colors.grey.withOpacity(0.8)),
            child: GestureDetector(
              onTap: () {
                if (i != _photoIndex) {
                  setState(() {
                    _photoIndex = i;
                  });
                }
              },
            ),
          ),
        ),
      );
    }
    return list;
  }

  Widget _itemColor({Color color}){
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
      ),
    );
  }

  Widget _itemMaterial({IconData icon, String text}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Icon(icon, color: Colors.grey, size: 50),
          ),
          Text(text, style: TextStyle(fontSize: 17))
        ],
      ),
    );
  }

  Widget _bottomNavigation(){
    return Material(
      elevation: 7,
      child: Container(
        height:80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: (){
                print('Huy Nguyen');
              },
              child: Container(
                width: 80,
                height: 80,
                child: Icon(Icons.shopping_cart, color: Colors.grey, size: 50),
              ),
            ),
            InkWell(
              onTap: (){
                print('Huy Nguyen');
              },
              child: Container(
                width: 80,
                height: 80,
                child: Icon(Icons.account_box, color: Colors.grey, size: 50),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  print('Huy Nguyen');
                },
                child: Container(
                  height: 80,
                  color: Color(0xFFFEDD59),
                  child: Center(child: Text('Add To Card', style: TextStyle(fontSize: 25, color: Colors.white))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
