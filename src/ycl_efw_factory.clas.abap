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
    data: ls_exit type yefw_exit.
    select single class from yefw_exit
        where prog = @iv_prog and place = @iv_place
        into @ls_exit.
    if sy-subrc = 0.
    create object ro_exit type (ls_exit-class).
    else.

    endif.
  endmethod.

endclass.
