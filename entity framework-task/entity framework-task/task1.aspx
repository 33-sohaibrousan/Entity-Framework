<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task1.aspx.cs" Inherits="entity_framework_task.task1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-group row">
    <label for="name" class="col-4 col-form-label">Name</label> 
    <div class="col-8">
      <input id="name" runat="server" name="name" placeholder="Name" type="text"  class="form-control"/>
    </div>
  </div>
  <div class="form-group row">
    <label for="city" class="col-4 col-form-label">City</label> 
    <div class="col-8">
        <asp:DropDownList ID="DropDownList1" class="form-cotrol" runat="server"></asp:DropDownList>
    </div>  
  </div>
            <div class="form-group row">
                <label for="age" class="col-4 col-form-label">Age</label>
                <div class="col-8">
                    <input id="age" name="age" runat="server" placeholder="Age" type="text" class="form-control" />
                </div>
            </div>
  <div class="form-group row">
    <label for="phone" class="col-4 col-form-label">Phone</label> 
    <div class="col-8">
      <input id="phone" name="phone"  runat="server" placeholder="Phone" type="text"  class="form-control"/>
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-4 col-form-label">Email</label> 
    <div class="col-8">
      <input id="email" name="email"  runat="server" placeholder="Email" type="text"  class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="photo" class="col-4 col-form-label">Photo</label> 
    <div class="col-8">
<%--      <input id="photo" name="photo"  runat="server" placeholder="Photo" type="text" class="form-control">--%>
        <asp:FileUpload ID="FileUpload1"  runat="server" />
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click1" />
    </div>
  </div>
 <div class="form-group row">
    <label for="search" class="col-4 col-form-label">search</label> 
    <div class="col-8">
      <input id="search" name="search"  runat="server" placeholder="search" type="text"  class="form-control">
       <asp:Button ID="Button2" runat="server" Text="search" OnClick="Button2_Click" />

        </div>

  </div>
        </div>
        <asp:Label ID="lblNum" runat="server"  Text="Label" BackColor="Lime"> </asp:Label><br />
        <asp:Label ID="lblAvg" runat="server"  Text="Label" BackColor="#FFCCFF"></asp:Label><br />
        <asp:Label ID="lblMax" runat="server"  Text="Label" BackColor="#FF3300">  </asp:Label>


                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                          

                            <asp:TemplateField HeaderText="Photo" AccessibleHeaderText="Photo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Photo") %>' width="200px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <%-- <asp:ImageField DataImageUrlField="Photo" FooterStyle-Width="200px">
                            </asp:ImageField>--%>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

    </form>
</body>
</html>
