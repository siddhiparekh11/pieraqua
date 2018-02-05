function cut(){
    var menu_id = $('a').attr('id');
    alert(menu_id + ' :: Cut Function fired from menu_action.js file');
}
function copy(){
    var menu_id = $('a').attr('id');
    alert(menu_id + ' :: Copy Function fired from menu_action.js file');
    
}
function paste(){
    var menu_id = $('a').attr('id');
    alert(menu_id + ' :: Paste Function fired from menu_action.js file');
}
function edit() {
  window.location="http://localhost:3965/Pier%20Aqua/cms/EditProductCategory.aspx"
}
function del(){
    var menu_id = $('a').attr('id');
    alert(menu_id + ' :: Delete Function fired from menu_action.js file');
}