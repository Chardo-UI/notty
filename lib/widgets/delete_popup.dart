import 'package:flutter/material.dart';
import 'package:notty/helper/note_provider.dart';
import 'package:notty/models/note.dart';
import 'package:provider/provider.dart';

class DeletePopUp extends StatelessWidget {
  final Note selectedNote;

  DeletePopUp(this.selectedNote);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text('Hapus?'),
      content: Text('Apakah anda yakin menghapus?'),
      actions: [
        TextButton(
          child: Text('Ya'),
          onPressed: () {
            Provider.of<NoteProvider>(context, listen: false)
                .deleteNote(selectedNote.id);
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        TextButton(
          child: Text('Tidak'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
