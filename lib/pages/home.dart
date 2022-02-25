import 'package:database/pages/pinterest.dart';
import 'package:database/pages/profile.dart';
import 'package:database/pages/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int _index = 0;

  final List<Widget> pages = [
    const FeedPage(key: PageStorageKey(1),),
    const SearchPage(key: PageStorageKey(2),),
    const ProfilePage(key: PageStorageKey(3),)
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        pages[_index],
        Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home_filled,
                        color: _index == 0 ? Colors.black : Colors.grey,
                        size: 30,),
                      onPressed: (){
                        if(_index != 0){
                          setState(() {
                            _index = 0;
                          });
                        }
                      },),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: _index == 1 ? Colors.black : Colors.grey,
                        size: 30,),
                      onPressed: (){
                        if(_index != 1){
                          setState(() {
                            _index = 1;
                          });
                        }
                      },
                    ),
                    IconButton(icon:const Icon(Icons.message, color: Colors.grey,size: 30,), onPressed:(){},),
                    IconButton(
                      icon: const Icon(Icons.circle, color: Colors.grey,size: 30,),
                      onPressed: (){
                        if(_index != 2){
                          setState(() {
                            _index = 2;
                          });
                        }
                      },)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15.0,
                        spreadRadius: 5.0,
                      )
                    ]
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

}
