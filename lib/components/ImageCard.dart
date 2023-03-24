import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageCard extends StatelessWidget {
  String? imageLocation;
  String? doctorName;
  String? doctorDepartment;
  ImageCard({
    super.key,
    required this.imageLocation,
    required this.doctorName,
    required this.doctorDepartment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
      // color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            height: 150,
            imageLocation.toString(),
            fit: BoxFit.contain,
          ),
          SizedBox(height: 10),
          Text(doctorName ?? "Doctor Name",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )),
          Text(doctorDepartment ?? "Specialty"),
        ],
      ),
    );
  }
}
