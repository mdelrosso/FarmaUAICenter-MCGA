using System;
using System.Configuration;

namespace FarmaUAICenter.Menus.Administrador
{
    public partial class BackupRestore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BackUp_Click(object sender, EventArgs e)
        {
            BLL.Sistema sistema = new BLL.Sistema();//llamamos al metodo para realizar el backup le pasamos las varialbles a traves config de la app
            sistema.Backup(ConfigurationManager.AppSettings["Base"],
                ConfigurationManager.AppSettings["Directorio"],
                ConfigurationManager.AppSettings["NombreArchivo"]);

        }

        protected void Restore_Click(object sender, EventArgs e)
        {
           
        }

        protected void Restore_Click1(object sender, EventArgs e)
        {
            BLL.Sistema sistema = new BLL.Sistema();
            string nombrebase = ConfigurationManager.AppSettings["Base"];
            string directorio = ConfigurationManager.AppSettings["Directorio"];

            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);
            

   
            if (FileUpload1.HasFile )
            {
                if (extension==".bak")
                {
                    

                    string nombrearchivo = FileUpload1.FileName;
                   bool validacion= sistema.Restore(nombrebase, directorio, nombrearchivo);

                    if (validacion)
                    {
                        string msg = "Restore Exitoso";
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(),"alert", "alert('"+msg+"');", true);
                    }
                    else
                    {
                        string msg = "Error";
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');", true);
                    }
                }
                else
                {
                    Label1.Text = "Archivo incorrecto";
                }
                
            }
            else
            {
                Label1.Text = "Debe seleccionar un archivo";
            }



            
        }

       
    }
}