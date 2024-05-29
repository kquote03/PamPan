import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

class SearchablePantry extends StatefulWidget {
  const SearchablePantry({super.key});

  @override
  State<SearchablePantry> createState() => _SearchablePantryState();
}

class _SearchablePantryState extends State<SearchablePantry> {
  final List<Actor> actors = [
    Actor(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
    Actor(age: 58, name: 'Johnny', lastName: 'Depp'),
    Actor(age: 78, name: 'Robert', lastName: 'De Niro'),
    Actor(age: 44, name: 'Tom', lastName: 'Hardy'),
    Actor(age: 66, name: 'Denzel', lastName: 'Washington'),
    Actor(age: 49, name: 'Ben', lastName: 'Affleck'),
  ];

  final Map<String, List<Actor>> mapOfActors = {
    'test 1': [
      Actor(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
      Actor(age: 66, name: 'Denzel', lastName: 'Washington'),
      Actor(age: 49, name: 'Ben', lastName: 'Affleck'),
    ],
    'test 2': [
      Actor(age: 58, name: 'Johnny', lastName: 'Depp'),
      Actor(age: 78, name: 'Robert', lastName: 'De Niro'),
      Actor(age: 44, name: 'Tom', lastName: 'Hardy'),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchableList<Actor>(
        sortWidget: Icon(Icons.sort),
        sortPredicate: (a, b) => a.age.compareTo(b.age),
        itemBuilder: (item) {
          return ActorItem(actor: item);
        },
        initialList: actors,
        filter: (p0) {
          return actors.where((element) => element.name.contains(p0)).toList();
        },
        inputDecoration: InputDecoration(
          labelText: "Search Actor",
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class ActorItem extends StatelessWidget {
  final Actor actor;

  const ActorItem({
    super.key,
    required this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Firstname: ${actor.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lastname: ${actor.lastName}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Age: ${actor.age}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class Actor {
  int age;
  String name;
  String lastName;

  Actor({
    required this.age,
    required this.name,
    required this.lastName,
  });
}
