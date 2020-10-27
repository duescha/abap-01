CLASS ycl_efm_context DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      "! Konstruktor
      constructor IMPORTING ir_data TYPE REF TO data,
      get_data
        RETURNING VALUE(rr_data) TYPE REF TO data,
      set_data
        IMPORTING ir_data TYPE REF TO data..

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: data TYPE REF TO data.

ENDCLASS.



CLASS ycl_efm_context IMPLEMENTATION.

  METHOD set_data.
    me->data = ir_data.
  ENDMETHOD.

  METHOD constructor.
    me->data = ir_data.
  ENDMETHOD.

  METHOD get_data.
    rr_data = me->data.
  ENDMETHOD.

ENDCLASS.
