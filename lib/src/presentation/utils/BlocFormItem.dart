class BlocFormItem{
  final String value;
  final String? error;

  const BlocFormItem({
    this.value = '',
    this.error
  });

  //Crear un metodo que me ayude modificar los valores
  BlocFormItem copyWidth({String? value,String?error}){
    return BlocFormItem(
      value: value ?? this.value,
      error: error ?? this.error
    );
  }
}