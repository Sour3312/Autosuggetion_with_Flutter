// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, equal_keys_in_map

void main() {
  var usrMap = {
    "name": "Tom",
    'Email': 'tom@xyz.com',
    "age": "Tom",
    'www': 'tom@xyz.com'
  };
  usrMap.forEach((k, v) => print('$k: $v'));
}
