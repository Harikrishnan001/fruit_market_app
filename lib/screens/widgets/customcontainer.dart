import 'package:flutter/material.dart';
import '../details_screen.dart';
import '/models/item.dart';
import './rating_stars.dart';

class TapContainer extends StatefulWidget {
  final Item item;

  const TapContainer({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer> {
  Color getColor()
  {
       if(widget.item.fav==false)
       {
         return  Colors.grey;
       }
       else
       {
         return Colors.red;
       }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          height: 170,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.network(widget.item.imageURL),
                    ),
                  GestureDetector(
                    onTap: ()
                    {
                      
                      setState(() {
                        widget.item.fav=widget.item.fav==false?true:false;
                       
                     
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color:getColor(),
                  )
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: RatingStars(
                  initialRating: widget.item.rating,
                  onTap: (n) {
                    setState(() {
                      widget.item.rating = n;
                    });
                  },
                  starSize: 24,
                ),
              ),
              Text(widget.item.name),
              Text("${widget.item.price} per/kg"),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DetailsScreen(
                    item: widget.item,
                  )));
        });
  }
}
