﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnBid_Click(object sender, EventArgs e)
        {
            if (!UserIsLoggedIn())
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("~/userpage/UserIndex.aspx");
            }
        }

        private bool UserIsLoggedIn()
        {
            return Session["UserName"] != null && Session["UserID"] != null;
        }
    }
}