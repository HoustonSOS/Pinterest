import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  var controller = TextEditingController();
  final gridController = ScrollController(keepScrollOffset: false);
  final List<String> suggestions = [
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
      body: SingleChildScrollView(
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
                  controller: gridController,
                  primary: false,
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
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      child: Text(suggestions[index],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
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
                    controller: gridController,
                    primary: false,
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
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        child: Text(suggestions[index],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
