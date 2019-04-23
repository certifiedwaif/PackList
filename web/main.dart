import 'dart:html';

InputElement itemInput = InputElement();
ButtonElement addButton = ButtonElement();
DivElement itemContainer = DivElement();

void main() {
  var title = Element.html('<h2>PackList</h2>');
  document.body.children.add(title);

  itemInput
    ..id = 'txt-item'
    ..placeholder = 'Enter an item';
  document.body.children.add(itemInput);

  addButton
    ..id = 'btn-add'
    ..text = 'Add';
  document.body.children.add(addButton);

  itemContainer
    ..id = 'items'
    ..style.width = '300px'
    ..style.border = '1px solid black'
    ..innerHtml = '&nbsp;';
  document.body.children.add(itemContainer);

  addButton.onClick.listen((event) {
    addItem();
  });

  itemInput.onKeyPress.listen((event) {
    if (event.keyCode == 13) {
      addItem();
    }
  });
}

class PackItem {
  String itemText;
  DivElement _uiElement;
  bool _isPacked = false;

  PackItem(this.itemText) {}
  DivElement get uiElement {
    if (_uiElement == null) {
      _uiElement = DivElement();
      _uiElement
        ..classes.add('item')
        ..text = this.itemText
        ..onClick.listen((event) => isPacked = !isPacked);
    }
    return _uiElement;
  }

  set uiElement(DivElement value) => _uiElement = value;

  set isPacked(value) {
    _isPacked = value;
    if (_isPacked) {
      uiElement.classes.add('packed');
    } else {
      uiElement.classes.remove('packed');
    }
  }

  get isPacked => _isPacked;
}

void addItem() {
  var packItem = PackItem(itemInput.value);
  itemContainer.children.add(packItem.uiElement);
  itemInput.value = '';
}
