CLASS ycl_efm_exit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      set_context
        IMPORTING io_context TYPE REF TO ycl_efm_context,
      execute,
      get_context
        RETURNING
          VALUE(ro_context) TYPE REF TO ycl_efm_context.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: context TYPE REF TO ycl_efm_context.


ENDCLASS.



CLASS ycl_efm_exit IMPLEMENTATION.

  METHOD set_context.
    me->context = io_context.
  ENDMETHOD.

  METHOD get_context.
    ro_context = me->context.
  ENDMETHOD.

  METHOD execute.

    DATA: lr_data TYPE REF TO data.
    DATA: lr_data1 TYPE REF TO ycl_efm_test=>ty_data.
    lr_data = me->context->get_data( ).

    lr_data1 ?= lr_data.
    lr_data1->value = 'hallo'.

    me->context->set_data( lr_data ).

  ENDMETHOD.

ENDCLASS.
