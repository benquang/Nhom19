using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Nhom19.Business;

namespace Nhom19.Model
{
    public class UserDB
    {
        public static bool isExistUser(String user_id)
        {
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection("data source=localhost; database=Hai;User ID = "+ConnectionP.user_id+"; Password = "+ConnectionP.pass);
                conn.Open();

                SqlCommand cm = new SqlCommand();
                cm.CommandText = "IsExistUser_Proc";
                cm.CommandType = CommandType.StoredProcedure;
                cm.Connection = conn;

                cm.Parameters.Add("@user_id", SqlDbType.NVarChar).Value = user_id;

                return (bool)cm.ExecuteScalar();
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conn.Close();
            }
        }
        public static bool isValidPassword(String user_id, String pass)
        {
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection("data source=localhost; database=Hai;User ID = " + ConnectionP.user_id + "; Password = " + ConnectionP.pass);
                conn.Open();

                SqlCommand cm = new SqlCommand();
                cm.CommandText = "IsValidPassword_Proc";
                cm.CommandType = CommandType.StoredProcedure;
                cm.Connection = conn;

                cm.Parameters.Add("@user_id", SqlDbType.NVarChar).Value = user_id;
                cm.Parameters.Add("@pass", SqlDbType.NVarChar).Value = pass;

                return (bool)cm.ExecuteScalar();
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conn.Close();
            }
        }
        public static bool isAdmin(String user_id)
        {
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection("data source=localhost; database=Hai;User ID = bo; Password = 123456");
                conn.Open();

                SqlCommand cm = new SqlCommand();
                cm.CommandText = "IsAdmin_Proc";
                cm.CommandType = CommandType.StoredProcedure;
                cm.Connection = conn;

                cm.Parameters.Add("@user_id", SqlDbType.NVarChar).Value = user_id;

                return (bool)cm.ExecuteScalar();
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
