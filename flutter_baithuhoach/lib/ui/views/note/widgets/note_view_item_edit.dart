import 'package:flutter/material.dart';
import 'package:flutter_baithuhoach/ui/views/note/note_model.dart';
import 'package:flutter_baithuhoach/ui/views/note/note_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NoteViewItemEdit extends ViewModelWidget<NoteViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => model.state = NoteViewState.listView,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => model.saveItem(),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Họ',
            ),
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập họ',
                ),
                controller: model.editingControllerLastName),
            SizedBox(height: 20),
            Text(
              'Tên',
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nhập tên',
              ),
              controller: model.editingControllerName,
            ),
            SizedBox(height: 20),
            Text(
              'Số điện thoại',
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nhập số điện thoại',
              ),
              controller: model.editingControllerPhoneNumber,
            ),
            SizedBox(height: 20),
            Text(
              'EMail',
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nhập email',
              ),
              controller: model.editingControllerEMail,
            )
          ],
        ),
      ),
    );
  }
}
