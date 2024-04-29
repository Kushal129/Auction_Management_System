using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace User_Side
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null && Session["UserName"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    string userEmail = Session["UserName"].ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT fullname, mobile, user_img FROM tbl_user WHERE email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", userEmail);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtName.Text = reader["fullname"].ToString().Trim();
                        txtCno.Text = reader["mobile"].ToString().Trim();
                        txtEmail.Text = userEmail;

                        string imagePath = reader["user_img"].ToString().Trim();
                        imgProfile.ImageUrl = ResolveUrl("~/Uploads/UserUploadImg/" + imagePath);
                    }
                    reader.Close();
                    con.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string imagePath = SaveUserImage(FileUploadControl.PostedFile);

            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tbl_user SET fullname = @FullName, mobile = @Mobile, user_img = @ImagePath WHERE email = @Email", con);
            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtCno.Text);
            cmd.Parameters.AddWithValue("@ImagePath", imagePath);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "updateSuccess", "alert('Profile updated successfully!');", true);
        }

        private string SaveUserImage(HttpPostedFile file)
        {
            string userImgPath = "";

            if (file != null && file.ContentLength > 0 && IsImageValid(file))
            {
                string fileExtension = Path.GetExtension(file.FileName).ToLower();
                string fileName = Path.GetFileName(file.FileName);
                string userImgFolderPath = Server.MapPath("~/Uploads/UserUploadImg/");
                string filePath = Path.Combine(userImgFolderPath, fileName); 

                file.SaveAs(filePath);
                userImgPath = fileName; 
            }

            return userImgPath;
        }



        private bool IsImageValid(HttpPostedFile file)
        {
            string fileExtension = Path.GetExtension(file.FileName).ToLower();
            return (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png");
        }

    }
}