abstract interface class IUpdateAble<T> {
  void onUpdate(T item);

  void onRemove(T item);
}
