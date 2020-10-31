@AbapCatalog.sqlViewName: 'YEFW_DATA_EXIT_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Definition for Exit'
define view yefw_data_exit as select id from yefw_exit;
   
