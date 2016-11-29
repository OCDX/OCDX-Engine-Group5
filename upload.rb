<%= form_tag :action => 'update', :id => @some_object %>
<%= form_tag( { :action => :save, }, { :method => :post })%>
<%= form_tag( { :action => 'upload'}, :multipart => true ) %>
<%= form_tag( { :action => 'upload'}, :multipart => true ) %>
  upload file: <%= file_field( "form", "file" ) %>
  <br/>

  <%=submit_tag( "Upload File" ) %>
<%= end_form_tag %>
