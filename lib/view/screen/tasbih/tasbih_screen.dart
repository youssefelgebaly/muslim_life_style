import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/tasbih/tasbih_model.dart';
import 'package:mslim_life_style/view/screen/tasbih/selected_tasbih_screen.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  Tasbihs tasbihs = Tasbihs();

  @override
  void initState() {
    // TODO: implement initState
    tasbihs.initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('التسبيح', style: TextStyle(color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>  InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectedTasbihScreen(tasbihModel: tasbihs.tasbihs[index],)));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0.6, 1.2), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        '${tasbihs.tasbihs[index].reference}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      '${tasbihs.tasbihs[index].content}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontFamily: 'Uthman'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${tasbihs.tasbihs[index].count}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Text(
                        'counts',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: tasbihs.tasbihs.length,
      ),);


  }
}
