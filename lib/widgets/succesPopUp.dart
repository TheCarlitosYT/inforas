import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final String title;

  const SuccessPopup({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSuccessPopup(context),
    );
  }

  void showSuccessPopup(BuildContext context) {
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
          height: 85,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.9),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSuccessPopup(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Success Popup Content'),
      ),
    );
  }
}
