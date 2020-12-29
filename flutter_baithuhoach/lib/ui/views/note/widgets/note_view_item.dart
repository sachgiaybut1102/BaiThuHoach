import 'package:flutter/material.dart';
import 'package:flutter_baithuhoach/ui/views/note/note_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NoteViewItem extends ViewModelWidget<NoteViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết thông tin'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => model.state = NoteViewState.listView,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit), onPressed: () => model.updateItem())
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Họ: ${model.editingItem.lastname}',
              ),
              SizedBox(height: 10),
              Text(
                'Tên: ${model.editingItem.name}',
              ),
              SizedBox(height: 10),
              Text(
                'Số điện thoại: ${model.editingItem.phonenumber}',
              ),
              SizedBox(height: 10),
              Text(
                'EMail: ${model.editingItem.emailaddress}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
