using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmaUAICenter.MessageBox.Codigo
{
    public static class Mensaje
    {
        public static void Mostrar(string titulo, string mensaje, string eventName, MessageBox.MessageBoxIcons icono, MessageBox.MessageBoxButtons botones, MessageBox.MessageBoxStyle estilo, Literal literal, Page pagina)
        {
            MessageBox messageBox = new MessageBox
            {
                MessageTitle = titulo,
                MessageText = mensaje,
                MessageIcons = icono,
                MessageButtons = botones,
                MessageStyles = estilo

            };


            messageBox.SuccessEvent.Add(eventName);

            literal.Text = messageBox.Show(pagina);
        }

        public static void Mostrar(string titulo, string mensaje, MessageBox.MessageBoxIcons icono, MessageBox.MessageBoxButtons botones, MessageBox.MessageBoxStyle estilo, Literal literal, Page pagina)
        {
            MessageBox messageBox = new MessageBox
            {
                MessageTitle = titulo,
                MessageText = mensaje,
                MessageIcons = icono,
                MessageButtons = botones,
                MessageStyles = estilo

            };


            literal.Text = messageBox.Show(pagina);
        }
    }
}