<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CadastroContatos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .custom-gridview {
            border: 2px solid #808080;
            border-collapse:separate;
        }
        .custom-gridview th, .custom-gridview td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .custom-gridview th {
            background-color: #ca6149;
            color:antiquewhite;
            text-align: center;
        }
        .custom-h1{
            text-align:left;
            background-image:linear-gradient(to right,white,#f6de9c,#f6e560);
            font-family:Verdana, Geneva, Tahoma, sans-serif;
        }
        .custom-gridview input[type="text"]{
            font-size:10px;
        }
        .custom-gridview select{
            font-size: 10px;
        } 
        .custom-gridview textarea {
        font-size: 6px;
        padding: 8px;
        border: 2px dashed #ddd;
        }
        .btn-edit 
        {
        background-color: #2a4ac7;
        border: none; 
        color: white; 
        padding: 8px 15px; 
        text-align: center; 
        text-decoration: none; 
        display: inline-block; 
        font-size: 10px; 
        margin: 4px 2px; 
        transition-duration: 0.4s; 
        cursor: pointer; 
        }
       
        .btn-cancel 
        {
        background-color: #f44336; 
        border: none; 
        color: white; 
        padding: 8px 15px; 
        text-align: center; 
        text-decoration: none; 
        display: inline-block; 
        font-size: 10px; 
        margin: 4px 2px; 
        transition-duration: 0.4s; 
        cursor: pointer; 
        }
       .btn-cadastra
       {
        background-color:#F8E5B1;
       }
       .custom-titulo
       {
          font-family: 'Arial Narrow', Arial, sans-serif;
       }
    </style>

    <main>

        <asp:UpdatePanel runat="server">
            <ContentTemplate runat="server">

       <div class="custom-h1">

           <h1 class="custom-titulo" >CADASTRO DE CONTATOS</h1>

        <br>Nome:<font color="#FF0000">*</font><asp:TextBox ID="txtNome" runat="server"></asp:TextBox><br><br>

        Email:<font color="#FF0000">*</font><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br><br>

        Data De Nascimento:<font color="#FF0000">*</font><asp:TextBox ID="txtData" runat="server"></asp:TextBox><br><br>

        CPF:<font color="#FF0000">*</font><asp:TextBox ID="txtCPF" runat="server"></asp:TextBox><br><br>

        Estado:<asp:TextBox ID="txtEstado" runat="server"></asp:TextBox><br><br>

        Cidade:<asp:TextBox ID="txtCidade" runat="server"></asp:TextBox><br><br>

        Endereço:<asp:TextBox ID="txtEndereco" runat="server"></asp:TextBox><br><br>
           

        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" CssClass="btn-cadastra"/> <asp:Button ID="btnExcluir" runat="server" Text="Apagar" OnClick="btnExcluir_Click" CssClass="btn-cadastra"/> <br><br>
           </div>
                </ContentTemplate>
            </asp:UpdatePanel>       
        <asp:UpdatePanel runat="server">
    <ContentTemplate runat="server">

         <div>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" CssClass="custom-gridview"
    OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" class="custom-h1">
    <Columns>
        <asp:TemplateField HeaderText="Nome">
            <ItemTemplate>
                <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblNomeEdit" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblEmailEdit" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Data de Nascimento">
            <ItemTemplate>
                <asp:Label ID="lblDataDeNascimento" runat="server" Text='<%# Eval("DataDeNascimento") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblDataDeNascimentoEdit" runat="server" Text='<%# Eval("DataDeNascimento") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="CPF">
            <ItemTemplate>
                <asp:Label ID="lblCPF" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblCPFEdit" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Estado">
            <ItemTemplate>
                <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblEstadoEdit" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Cidade">
            <ItemTemplate>
                <asp:Label ID="lblCidade" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblCidadeEdit" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Endereço">
            <ItemTemplate>
                <asp:Label ID="lblEndereco" runat="server" Text='<%# Eval("Endereco") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblEnderecoEdit" runat="server" Text='<%# Eval("Endereco") %>'></asp:Label>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn-edit"/>
        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn-cancel" /> 

    </Columns>
</asp:GridView>       
             <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
       
             
    </main>

</asp:Content>
