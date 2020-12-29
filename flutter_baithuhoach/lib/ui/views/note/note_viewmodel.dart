import 'package:flutter/material.dart';
import 'package:flutter_baithuhoach/ui/views/note/note_repository.dart';
import 'package:stacked/stacked.dart';

import 'note_model.dart';

/// Trạng thái của view
enum NoteViewState { listView, itemView, insertView, updateView }

class NoteViewModel extends BaseViewModel {
  final title = 'Quản lý danh bạ';

  /// Danh sách các bản ghi được load bất đồng bộ bên trong view model,
  /// khi load thành công thì thông báo đến view để cập nhật trạng thái
  var _items = <Note>[];

  /// ### Danh sách các bản ghi dùng để hiển thị trên ListView
  /// Vì quá trình load items là bất đồng bộ nên phải tạo một getter
  /// `get items => _items` để tránh xung đột
  List<Note> get items => _items;

  /// Trạng thái mặc định của view là listView, nó có thể thay đổi
  /// bên trong view model
  var _state = NoteViewState.listView;

  /// Khi thay đổi trạng thái thì sẽ báo cho view biết để cập nhật
  /// nên cần tạo một setter để vừa nhận giá trị vừa thông báo đến view
  set state(value) {
    // Cập nhật giá trị cho biến _state
    _state = value;

    // Thông báo cho view biết để cập nhật trạng thái của widget
    notifyListeners();
  }

  /// Cần có một getter để lấy ra trạng thái view cục bộ cho view
  NoteViewState get state => _state;

  Note editingItem;

  var editingControllerLastName = TextEditingController();
  var editingControllerName = TextEditingController();
  var editingControllerPhoneNumber = TextEditingController();
  var editingControllerEMail = TextEditingController();

  ///
  var repo = NoteRepository();

  Future init() async {
    return reloadItems();
  }

  Future reloadItems() async {
    return repo.items().then((value) {
      _items = value;
      notifyListeners();
    });
  }

  void addItem() {
    var timestamp = DateTime.now();
    var lastname = 'mới';
    var name = '';
    var phonenumber = '';
    var email = '';

    var item = Note(lastname, name, phonenumber, email);
    print(item);
    repo.insert(item).then((value) {
      reloadItems();
    });
  }

  void updateItem() {
    editingControllerLastName.text = editingItem.lastname;
    editingControllerName.text = editingItem.name;
    editingControllerPhoneNumber.text = editingItem.phonenumber;
    editingControllerEMail.text = editingItem.emailaddress;
    state = NoteViewState.updateView;
  }

  void saveItem() {
    // TODO lưu editingItem

    // TODO editingItem = null
    editingItem = null;
    notifyListeners();
  }
}
