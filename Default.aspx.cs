using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CadastroContatos
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                DataTable dt = new DataTable();
                dt.Columns.Add("Nome");
                dt.Columns.Add("Email");
                dt.Columns.Add("DataDeNascimento");
                dt.Columns.Add("CPF");
                dt.Columns.Add("Estado");
                dt.Columns.Add("Cidade");
                dt.Columns.Add("Endereco");

                ViewState["dt"] = dt;
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            // verifica se o grid view ta editando
            if (GridView1.EditIndex != -1)
            {
                int indiceLinha = GridView1.EditIndex;
                DataTable dt = ViewState["dt"] as DataTable;

                            
                    /*esse if verifica:
                    dt não é nulo,
                    indiceLinha é um índice válido e não-negativo,
                    indiceLinha está dentro do intervalo de linhas em dt.*/
                    if (dt != null && indiceLinha >= 0 && indiceLinha < dt.Rows.Count)
                    {
                    dt.Rows[indiceLinha]["Nome"] = txtNome.Text;
                    dt.Rows[indiceLinha]["Email"] = txtEmail.Text;
                    dt.Rows[indiceLinha]["DataDeNascimento"] = txtData.Text;
                    dt.Rows[indiceLinha]["CPF"] = txtCPF.Text;
                    dt.Rows[indiceLinha]["Estado"] = txtEstado.Text;
                    dt.Rows[indiceLinha]["Cidade"] = txtCidade.Text;
                    dt.Rows[indiceLinha]["Endereco"] = txtEndereco.Text;

                    ViewState["dt"] = dt;

                    GridView1.EditIndex = -1;

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    txtNome.Text = "";
                    txtEmail.Text = "";
                    txtData.Text = "";
                    txtCPF.Text = "";
                    txtEstado.Text = "";
                    txtCidade.Text = "";
                    txtEndereco.Text = "";

                    lblMensagem.Text = "<strong><font color=green> Cadastro atualizado com sucesso! </font> </strong>";
                }
            }
            else
            {
                // se nao tive editando cria um novo contato
                DataTable dt = ViewState["dt"] as DataTable;

                if (string.IsNullOrEmpty(txtNome.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtData.Text) || string.IsNullOrEmpty(txtCPF.Text))
                {
                    lblMensagem.Text = "<strong><font color=red> PREENCHA OS CAMPOS OBRIGATÓRIOS </font> </strong>";
                    return;
                }

                if (dt != null)
                {
                    dt.Rows.Add(txtNome.Text, txtEmail.Text, txtData.Text, txtCPF.Text, txtEstado.Text, txtCidade.Text, txtEndereco.Text);

                    ViewState["dt"] = dt;

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    lblMensagem.Text = "<strong><font color=green> Cadastro adicionado com sucesso! </font> </strong>";

                    txtNome.Text = "";
                    txtEmail.Text = "";
                    txtData.Text = "";
                    txtCPF.Text = "";
                    txtEstado.Text = "";
                    txtCidade.Text = "";
                    txtEndereco.Text = "";
                }
            }
        }
        protected void btnExcluir_Click(object sender, EventArgs e)
        {
           
            txtNome.Text = "";
            txtEmail.Text = "";
            txtData.Text = "";
            txtCPF.Text = "";
            txtEstado.Text = "";
            txtCidade.Text = "";
            txtEstado.Text = "";
            txtEndereco.Text = "";

            lblMensagem.Text = "<strong><font color=gray> Rascunho apagado </font></strong>";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            DataTable dt = ViewState["dt"] as DataTable;
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (dt != null && e.NewEditIndex >= 0 && e.NewEditIndex < dt.Rows.Count)
            {
                DataRow row = dt.Rows[e.NewEditIndex];

                txtNome.Text = row["Nome"].ToString();
                txtEmail.Text = row["Email"].ToString();
                txtData.Text = row["DataDeNascimento"].ToString();
                txtCPF.Text = row["CPF"].ToString();
                txtEstado.Text = row["Estado"].ToString();
                txtCidade.Text = row["Cidade"].ToString();
                txtEndereco.Text = row["Endereco"].ToString();
            }
            

            lblMensagem.Text = "<strong><font color=gray> Aguardando a edição de dados... </font></strong>";           
        }


        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtNome.Text = "";
            txtEmail.Text = "";
            txtData.Text = "";
            txtCPF.Text = "";
            txtEstado.Text = "";
            txtCidade.Text = "";
            txtEstado.Text = "";
            txtEndereco.Text = "";
            GridView1.EditIndex = -1;
            GridView1.DataSource = ViewState["dt"] as DataTable;
            GridView1.DataBind();
            lblMensagem.Text = "<strong><font color=red> Atualizações de dados cancelada </font> </strong>";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = ViewState["dt"] as DataTable;

            if (dt != null)
            {
                int pegarLinha = e.RowIndex;

                dt.Rows[pegarLinha].Delete();

                dt.AcceptChanges();

                ViewState["dt"] = dt;

                GridView1.EditIndex = -1;

                GridView1.DataSource = dt;
                GridView1.DataBind();

                lblMensagem.Text = "<strong><font color=red> Cadastro excluído </font> </strong>";
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMensagem.Text = "<strong><font color=Black> PARA ATUALIZAR CLIQUE EM CADASTRAR </font> </strong>";
        }

    }
}