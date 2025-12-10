enum DeleteType {
  deactivate,
  delete;

  bool get isDelete => this == delete;
  bool get isDeactivate => this == deactivate;
}
