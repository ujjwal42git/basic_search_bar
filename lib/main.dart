import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Search Bar',
      theme: ThemeData(
        primarySwatch: Colors.red,      ),
      home: SearchBarScreen(),
    );
  }
}

class SearchBarScreen extends StatefulWidget {
  @override
  _SearchBarScreenState createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  
  TextEditingController _searchController = TextEditingController();

  
  List<String> _items = [
    'Ujjwal',
    'Mahima',
    'India',
    'Aiden',
    'Om',
    'Krish',
    'Vivek',
    'Miami',
    'Qatar',
  ];

  
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; 
    _searchController.addListener(_filterSearchResults); 
  }

  void _filterSearchResults() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search...',
                hintText: 'Type to search fruits',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
