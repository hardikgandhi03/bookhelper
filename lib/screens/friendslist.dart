import 'package:flutter/material.dart';

class Friend {
  final String friendName;
  final int streak;

  const Friend(this.friendName, this.streak);
}

class friendList extends StatelessWidget {
  const friendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Friend> Friends = List.generate(
      30,
      (i) => Friend(
        'Friend name $i',
        i,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("Friends List"),
        backgroundColor: Color(0xff2855ae),
        actions: [],
      ),
      body: ListView.builder(
        itemCount: Friends.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              //borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade200,
            ),
            child: ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(Friends[index].friendName),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(Friends[index].streak.toString()),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.yellow.shade600,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add_alt),
        onPressed: () {},
      ),
    );
  }
}
