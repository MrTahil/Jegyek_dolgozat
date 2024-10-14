using MySql.Data.MySqlClient;
namespace Osztalyzatok_api
{
    public class Connect
    {
        public MySqlConnection Connection;
        private string MysqlConnectionString;

        private string Host;
        private string Database;
        private string User;
        private string Password;

        public Connect()
        {
            Host = "localhost";
            Database = "jegyek";
            User = "root";
            Password = "";
            MysqlConnectionString = "SERVER=" + Host + ";DATABASE=" + Database + ";UID=" + User + ";PASSWORD=" + Password + ";SslMode=None";
            Connection = new MySqlConnection(MysqlConnectionString);
        }
    }
}