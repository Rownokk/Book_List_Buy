import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Font',
          ),
        ),
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookListPage(),
                ),
              );
            },
            child: Text(
              'Welcome...'
                  'Lets Explore Books',

              style: TextStyle(
                fontFamily: 'Font',
                fontSize: 23.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book List',
          style: TextStyle(
            fontFamily: 'Font',
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/liist.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(24.0),
          children: [
            BookCard(
              bookName: 'Robot-Proof',
              authorName: 'Joseph E.Aoun',
              rating: '4.4',
              bookCoverAsset: 'assets/images/book2.jpg',
              price: 20.25,
              description: ' This book is an authoritative call for action and a compelling model for the next step in the evolution of higher education. ',
            ),
            BookCard(
              bookName: 'Python Crash Course',
              authorName: 'Eric Mathes',
              rating: '5.0',
              bookCoverAsset: 'assets/images/book3.jpg',
              price: 31.93,
              description: 'Python Crash Course is the world’s best-selling guide to the Python programming language.',
            ),
            // Add more BookCard instances with unique bookCoverAsset paths
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String bookCoverAsset;
  final double price;
  final String description;

  const BookCard({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.bookCoverAsset,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(bookCoverAsset),
        ),
        title: Text(
          bookName,
          style: TextStyle(
            fontFamily: 'Font',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorName,
              style: TextStyle(
                fontFamily: 'Font',
              ),
            ),
            Text(
              'Rating: $rating',
              style: TextStyle(
                fontFamily: 'Font',
              ),
            ),
          ],
        ),
        trailing: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(
                  bookName: bookName,
                  authorName: authorName,
                  rating: rating,
                  bookCoverAsset: bookCoverAsset,
                  price: price,
                  description: description,
                ),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
          label: Text(
            'Buy Now',
            style: TextStyle(
              fontFamily: 'Font',
            ),
          ),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatefulWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String bookCoverAsset;
  final double price;
  final String description;

  const BuyNowPage({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.bookCoverAsset,
    required this.price,
    required this.description,
  });

  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buy Now',
          style: TextStyle(
            fontFamily: 'Font',
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Buyyyy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Name: ${widget.bookName}',
                style: TextStyle(
                  fontFamily: 'Font',
                ),
              ),
              SizedBox(height: 50.0),
              CircleAvatar(
                child: Image.asset(widget.bookCoverAsset),
                radius: 50,
              ),
              SizedBox(height: 50.0),
              Text(
                'Author: ${widget.authorName}',
                style: TextStyle(
                  fontFamily: 'Font',
                ),
              ),
              Text(
                'Rating: ${widget.rating}',
                style: TextStyle(
                  fontFamily: 'Font',
                ),
              ),
              Text(
                'Description: ${widget.description}',
                style: TextStyle(
                  fontFamily: 'Font',
                ),
              ),
              Text(
                'Price: \$${widget.price.toString()}',
                style: TextStyle(
                  fontFamily: 'Font',
                ),
              ),
              SizedBox(height: 70.0),
              DropdownButton<String>(
                items: ['Hard_Cover', 'Paper_Back', 'E-Book'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Font',
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue;
                  });
                },
                hint: Text(
                  'Select an option',
                  style: TextStyle(
                    fontFamily: 'Font',
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              if (selectedOption != null)
                Text(
                  'Selected: $selectedOption book Confirmed',
                  style: TextStyle(
                    fontFamily: 'Font',
                  ),
                ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(
                    fontFamily: 'Font',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




