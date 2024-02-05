import 'package:flutter/material.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: const Text('Show BottomSheet'),
        ),
      ),
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  'BottomSheet Title',
                  style: TextStyle(fontSize: 20),
                ),

                // isi konten bottom sheet

                ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share'),
                    onTap: () {
                      // aksi share
                    }),

                ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Get Link'),
                    onTap: () {
                      // aksi get link
                    }),

                // tombol close
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        });
  }
}
