import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin<SearchPage>{
  var controller = TextEditingController();
  var scrollController = ScrollController();
  List<String> suggestions = [
    "Nature",
    "Aesthetic",
    "Wallpaper",
    "Abstract",
    "Style",
    "Fitness",
    "Tech",
    "Inspiration"
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          height: size.height * 0.12,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 3.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(
                    inherit: false,
                    color: Colors.grey
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.grey.shade200,
                  hintText: "Search",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  alignment: Alignment.topCenter,
                  child: const Text("Ideas for you",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.topCenter,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 5.0
                      ),
                      itemBuilder: (context, index){
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(suggestions[index],
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
                            ],
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset("assets/images/$index.jpeg").image,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken)
                              ),
                              color: Colors.grey,
                              borderRadius: const BorderRadius.all(Radius.circular(25.0))
                          ),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  alignment: Alignment.topCenter,
                  child: const Text("Popular on Pinterest",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.topCenter,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 5.0
                        ),
                        itemBuilder: (context, index){
                          return Container(
                            clipBehavior: Clip.hardEdge,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(suggestions[index],
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset("assets/images/$index.jpeg").image,
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken)
                                ),
                                color: Colors.grey,
                                borderRadius: const BorderRadius.all(Radius.circular(25.0))
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width * 0.6,
                height: size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon:const Icon(Icons.home_filled, color: Colors.grey, size: 30,),
                      onPressed: (){
                      Navigator.of(context).pop();
                      },),
                    IconButton(
                      icon:const Icon(Icons.search, color: Colors.black,size: 30,),
                      onPressed: (){
                        Navigator.of(context).pushNamed("search_page");
                      },
                    ),
                    IconButton(icon:const Icon(Icons.message, color: Colors.grey,size: 30,), onPressed:(){},),
                    IconButton(icon:const Icon(Icons.circle, color: Colors.grey,size: 30,), onPressed: (){},)
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
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
