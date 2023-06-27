import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int number = 1;
  final List<String> _list = [];
  int _currentIndex = 0;
  // final List<Widget> _pages = [
  //   homePage(),
  //   home2(),
  //   home3(),
  //   homePage(),
  // ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("titleApp"),),
      body: Center(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$number", style: Theme.of(context).textTheme.headlineLarge,),
                  const SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      number++;
                    });
                  }, child: const Text("add"))
                ],
              ),
              Container(
                height: 100,
                width: 100,
                child: ListView(
                    children:
                    _list.map((e) => ListTile(title: Text(e),)).toList()
                ),
              ),
              Container(
                height: 200,
                width: 200,
                // child: _pages[_currentIndex],
              )
            ],
          )
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "主页",),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "主页",),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart),label: "主页",),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart),label: "主页",),

        ],
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex==2 ? Colors.yellow:Colors.deepOrangeAccent,
          onPressed: (){
            setState(() {
              number = number + 2;
              _list.add("value$number");
            });
          },
          child: const Icon(Icons.add),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}