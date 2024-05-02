using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem
{
    public partial class Registration : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void registerButton_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string mobileNumber = txtMobileNumber.Text;
            string email = Email_R.Text;
            string password = Password_R.Text;
            string hashedPassword = HashPassword(password);

            string userImgPath = SaveUserImage(fileUserImage.PostedFile);

            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(mobileNumber) || string.IsNullOrWhiteSpace(userImgPath) ||
                string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                ShowErrorMessage("All fields are required.");
                return;
            }

            if (!IsValidIndianMobileNumber(mobileNumber))
            {
                ShowErrorMessage("Enter a valid Mobile number.");
                return;
            }

            if (IsEmailExists(email))
            {
                ShowErrorMessage("Email already exists! Please use a different email address.");
                return;
            }

            string insertQuery = "INSERT INTO tbl_user (fullname, email, mobile, password, user_img) " +
                                 "VALUES (@FullName, @Email, @MobileNumber, @Password, @UserImg)";
            try
            {
                using (SqlConnection connection = new SqlConnection(con))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName);
                        cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@UserImg", userImgPath);
                        cmd.ExecuteNonQuery();
                    }
                }
                ClearFields();
                ShowSuccessMessage("Registration successful..!");
            }
            catch (Exception)
            {
                ShowErrorMessage("Registration failed! Please try again.");
            }
        }

        private void ShowErrorMessage(string message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", $"showToaster('{message}', 'red')", true);
        }

        private void ShowSuccessMessage(string message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", $"showToaster('{message}', 'green'); setTimeout(function(){{ window.location.href = 'Login.aspx'; }}, 2000);", true);
        }


        private string SaveUserImage(HttpPostedFile file)
        {
            string userImgPath = "";

            if (file != null && file.ContentLength > 0 && IsImageValid(file))
            {
                if (file.ContentLength >= 30 * 1024 && file.ContentLength <= 100 * 1024)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    string userImgFolderPath = Server.MapPath("/Uploads/UserUploadImg/");

                    string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
                    string filePath = Path.Combine(userImgFolderPath, uniqueFileName);

                    file.SaveAs(filePath);
                    userImgPath = uniqueFileName;
                }
            }

            return userImgPath;
        }


        private bool IsImageValid(HttpPostedFile file)
        {
            string fileExtension = Path.GetExtension(file.FileName).ToLower();
            return (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png");
        }

        private const string con = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private bool IsEmailExists(string email)
        {
            using (SqlConnection connection = new SqlConnection(con))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM tbl_user WHERE email = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        protected void ValidateMobileNumber(object source, ServerValidateEventArgs args)
        {
            string mobileNumber = args.Value;

            if (!string.IsNullOrEmpty(mobileNumber) && mobileNumber.Length == 10 && mobileNumber.All(char.IsDigit))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        private bool IsValidIndianMobileNumber(string mobileNumber)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(mobileNumber, "^[6-9]\\d{9}$");
        }

        private void ClearFields()
        {
            txtFullName.Text = string.Empty;
            txtMobileNumber.Text = string.Empty;
            Email_R.Text = string.Empty;
            Password_R.Text = string.Empty;
        }
        protected void ValidateUserImageSize(object source, ServerValidateEventArgs args)
        {
            if (fileUserImage.HasFile)
            {
                double fileSizeKB = fileUserImage.PostedFile.ContentLength / 1024.0;

                if (fileSizeKB < 100 || fileSizeKB > 200)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void ValidateUserImageType(object source, ServerValidateEventArgs args)
        {
            if (fileUserImage.HasFile)
            {
                string[] allowedFileTypes = { "image/jpeg", "image/jpg", "image/png" };
                string fileType = fileUserImage.PostedFile.ContentType;

                if (!allowedFileTypes.Contains(fileType))
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = false;
            }
        }


    }
}