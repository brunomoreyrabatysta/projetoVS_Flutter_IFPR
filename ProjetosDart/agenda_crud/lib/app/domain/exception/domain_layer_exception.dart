class DomainLayerExcpetion implements Exception {
  String cause;

  DomainLayerExcpetion(this.cause);

  @override
  String toString() {
    return this.cause;
  }
}
