CLASS ycl_efm_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_oo_adt_classrun.

    TYPES:
      BEGIN OF ty_data,
        id    TYPE i,
        value TYPE string,
      END OF ty_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_efm_test IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE ty_data, lr_data TYPE REF TO data,
          lo_exit TYPE REF TO ycl_efm_exit.

    ls_data-id = 1. ls_data-value = 'test'.

    delete from yefw_exit.
    GET REFERENCE OF ls_data INTO lr_data.
    lo_exit = ycl_efw_factory=>create( iv_prog = |{ sy-repid }| iv_place = '02' ).
    lo_exit->set_context( NEW ycl_efm_context( lr_data ) ).
    lo_exit->execute( ).
    lr_data = lo_exit->get_context(  )->get_data(  ).
  ENDMETHOD.

ENDCLASS.
