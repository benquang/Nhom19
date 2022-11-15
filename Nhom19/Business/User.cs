using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom19.Business
{
    public class User
    {
        private String user_id;
        private String pass;
        private String firstname;
        private String lastname;
        private String email;
        private String phone_number;
        private String avatar;
        private Boolean is_admin;
        private DateTime date_joined;
        private DateTime last_login;

        public string User_id { get => user_id; set => user_id = value; }
        public string Pass { get => pass; set => pass = value; }
        public string Firstname { get => firstname; set => firstname = value; }
        public string Lastname { get => lastname; set => lastname = value; }
        public string Email { get => email; set => email = value; }
        public string Phone_number { get => phone_number; set => phone_number = value; }
        public string Avatar { get => avatar; set => avatar = value; }
        public bool Is_admin { get => is_admin; set => is_admin = value; }
        public DateTime Date_joined { get => date_joined; set => date_joined = value; }
        public DateTime getLast_login()
        {
            return last_login;
        }
        public void setLast_login(DateTime last_login)
        {
            if (last_login != null)
            {
                this.last_login = last_login;
            }
            else
            {
                this.last_login = DateTime.Now;
            }
        }
    }
}
