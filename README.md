
# advance_text_field

a customizable text field.
an advance text field for flutter, customizable and contain two button for save and make editable text field.

<img src="https://user-images.githubusercontent.com/32927238/109797078-40e97380-7c19-11eb-8e91-bec72b5bbffd.gif" width="32%">

| Property | Description |
| --- | --- |
| `width` | Width of widget |
| `height` | Height of widget |
| `backgroundColor` | Background color of widget |
| `color` | Color of widget |
| `textColor` | Text color of widget |
| `textHintColor` | Text hint color of widget |
| `textStyle` | Text style of widget |
| `textHintStyle` | Text hint style of widget |
| `type` | type of widget that widget's initial state(Edit or Save)|
| `editLabel` | Edit label will showing for edit button of widget |
| `saveLabel` | Save label will showing for edit button of widget |
| `animationDuration` | Animation duration |
| `keyboardType` | Keyboard type of widget(default is 'text') |
| `textHint` | Hint text |
| `text` | initail text |
| `controller` | TextEditingController of widget |
| `onEditTap` | When user tap on edit button onEditTap will call |
| `onSaveTap` | When user tap on save button onSaveTap will call  |



Usage
-----

```dart
AdvanceTextField(
  type: AdvanceTextFieldType.EDIT,
  editLabel: Icon(
    Icons.edit,
    color: Colors.white,
  ),
  saveLabel: Icon(
    Icons.check,
    color: Colors.white,
  ),
  textHint: 'Something...',
  onEditTap: () {},
  onSaveTap: (text) {
    print('value is: $text');
  },
)
```

# advance_text_field

