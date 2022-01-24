import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/fruit_notification.dart';

class FruitNotificationWidget extends StatelessWidget {
  const FruitNotificationWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FruitNotification item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          height: 140,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.network(
                      item.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 174.0,
                      child: Text(
                        item.message,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                    Text(
                      item.getArrivalMessage(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          right: -320.0,
          top: -100.0,
          child: IconButton(
            onPressed: () {
              //TODO:implement more options
            },
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}
