class I18NMessages {
  final Map<String, dynamic> messages;

  I18NMessages(this.messages);

  String get(String key) {
    assert(key != null);
    assert(messages.containsKey(key));
    return messages[key];
  }
}
