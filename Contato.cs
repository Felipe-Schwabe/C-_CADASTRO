using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace CadastroContatos
{
    public class Contato
    {
       public string Nome {  get; set; }
        public string Email { get; set; }
        public string DataDeNascimento { get; set; }
        public string CPF { get; set; }
        public string Estado { get; set; }
        public string Cidade { get; set; }
        public string Endereco { get; set; }

    }
}