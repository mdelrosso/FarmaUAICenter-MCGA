﻿using System;

namespace FarmaUAICenter.Menus.Visitante
{
    public partial class Contatco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}