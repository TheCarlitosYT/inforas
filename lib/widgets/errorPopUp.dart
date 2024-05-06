import 'package:flutter/material.dart';

class ErrorPopup extends StatelessWidget {
  final String title;
  final String message;

  const ErrorPopup({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildErrorPopup(context),
    );
  }

  void showErrorPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 98,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white,
                          overflow: TextOverflow.clip),
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorPopup(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error Popup Content'),
      ),
    );
  }
}
