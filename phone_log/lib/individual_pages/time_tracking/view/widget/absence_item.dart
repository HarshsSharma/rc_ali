import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AbsenceItem extends StatelessWidget {
  const AbsenceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.amber,
      ),
      title: const Text(
        'Ali Hassan Ali',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: const Text(
        'Back in 3 days (02-Nov-19)',
        style: TextStyle(fontSize: 14),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(
            Icons.medical_services_outlined,
            color: Colors.deepOrange,
          ),
          SizedBox(height: 5),
          Text(
            'MS (EG)',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
