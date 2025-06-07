enum AppRoutes {
  home('/home'), ledgers('/ledgers'), category('/category'), bookmarks('/bookmarks')
  // trang details cho tat ca cac page detail va truyen vao child
  //tất cả nằm ở trong /home
  // còn lại sẽ là các route đi từ  home ra 
  // wallet('/wallet'),
  // setting('/setting'),

  ;
  final String path;

  const AppRoutes(this.path);
}
