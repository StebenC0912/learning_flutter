import "package:flutter/material.dart";

class ProductItem extends StatefulWidget {
  final String productName;
  final String price;
  final String imageURL;
  const ProductItem({
    super.key,
    required this.productName,
    required this.price,
    required this.imageURL,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 188, 238, 190),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image(
                image: NetworkImage('${widget.imageURL}'),
                width: 100,
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      // i want product name only 30 char, if more than 30 char, it will be cut and add "..."
                      widget.productName.length > 20
                          ? '${widget.productName.substring(0, 21)}...'
                          : widget.productName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.price}',
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                      iconSize: 18,
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      }),
                  // show quantity

                  Text('$quantity'),
                  IconButton(
                      icon: Icon(Icons.remove_circle, size: 18),
                      onPressed: () {
                        setState(() {
                          if (quantity > 0) {
                            quantity--;
                          }
                        });
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
