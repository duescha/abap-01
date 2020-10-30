class ycl_efw_factory definition
  public
  final
  create public .

  public section.
    class-methods:
      create importing iv_prog type string iv_place type string
      returning value(ro_exit) type ref to ycl_efm_exit.
  protected section.
  private section.
endclass.



class ycl_efw_factory implementation.
  method create.
    data: ls_exit type yefw_exit, lx_root type ref to cx_root.
    select single class from yefw_exit
        where prog = @iv_prog and place = @iv_place
        into @ls_exit.
    try.
        if sy-subrc = 0.
          create object ro_exit type (ls_exit-class).
        else.
          create object ro_exit.
          ls_exit-id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c22( ).
          ls_exit-prog = iv_prog.
          ls_exit-place = iv_place.
          data(descr) = cl_abap_typedescr=>describe_by_object_ref( ro_exit ).
          split descr->absolute_name at '=' into ls_exit-class ls_exit-class.
          insert yefw_exit from @ls_exit.
        endif.
      catch cx_sy_create_object_error into lx_root.
        ls_exit-activ = abap_false.
      catch cx_uuid_error into lx_root.
        ls_exit-activ = abap_false.
    endtry.
  endmethod.

endclass.
