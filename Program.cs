using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace project11s1p2
{
    internal class Program
    {
        static void Main(string[] args)
        {

            // A tesztadat a Kevin-Iván csapattól származik


            var kapcsolodas = new MySqlConnectionStringBuilder { Server = "127.0.0.1", Database = "project11s1p2", UserID = "root", Password = "" };
            var kapcsolat = new MySqlConnection(kapcsolodas.ConnectionString);
            kapcsolat.Open();
            var lekerdezes = kapcsolat.CreateCommand();

            lekerdezes.CommandText = "SELECT nev, szulev FROM rJatekos WHERE szulev = (SELECT MAX(szulev) FROM rJatekos) UNION SELECT nev, szulev FROM rJatekos WHERE szulev = (SELECT MIN(szulev) FROM rJatekos);";
            var olvasas = lekerdezes.ExecuteReader();
            while (olvasas.Read())
            {
                string ropiNev = olvasas.GetString(0);
                DateTime ropiSzulev = olvasas.GetDateTime(1);
                Console.WriteLine($"Név: {ropiNev}, Születési dátum: {ropiSzulev:yyyy-MM-dd}");
            }
            olvasas.Close();

            lekerdezes.CommandText = "SELECT nev, szulev FROM iJatekos WHERE szulev = (SELECT MAX(szulev) FROM iJatekos) UNION SELECT nev, szulev FROM iJatekos WHERE szulev = (SELECT MIN(szulev) FROM iJatekos);";
            olvasas = lekerdezes.ExecuteReader();
            while (olvasas.Read())
            {
                string ijaszNev = olvasas.GetString(0);
                DateTime ijaszSzulev = olvasas.GetDateTime(1);
                Console.WriteLine($"Név: {ijaszNev}, Születési dátum: {ijaszSzulev:yyyy-MM-dd}");
            }
            olvasas.Close();

            lekerdezes.CommandText = "SELECT nev, szulev FROM kJatekos WHERE szulev = (SELECT MAX(szulev) FROM kJatekos) UNION SELECT nev, szulev FROM kJatekos WHERE szulev = (SELECT MIN(szulev) FROM kJatekos);";
            olvasas = lekerdezes.ExecuteReader();
            while (olvasas.Read())
            {
                string keziNev = olvasas.GetString(0);
                DateTime keziSzulev = olvasas.GetDateTime(1);
                Console.WriteLine($"Név: {keziNev}, Születési dátum: {keziSzulev:yyyy-MM-dd}");
            }
            olvasas.Close();

            lekerdezes.CommandText = "SELECT nev, szulev FROM fJatekos WHERE szulev = (SELECT MAX(szulev) FROM fJatekos) UNION SELECT nev, szulev FROM fJatekos WHERE szulev = (SELECT MIN(szulev) FROM fJatekos);";
            olvasas = lekerdezes.ExecuteReader();
            while (olvasas.Read())
            {
                string fociNev = olvasas.GetString(0);
                DateTime fociSzulev = olvasas.GetDateTime(1);
                Console.WriteLine($"Név: {fociNev}, Születési dátum: {fociSzulev:yyyy-MM-dd}");
            }
            olvasas.Close();

            lekerdezes.CommandText = "SELECT Ijasz_csapat.Iskolanev, SUM(loveszetpont.csapatpont) AS osszes_pontszam FROM Ijasz_csapat JOIN iJatekos ON Ijasz_csapat.jatekos_Id = iJatekos.id JOIN loveszetpont ON iJatekos.pontok_Id = loveszetpont.id GROUP BY Ijasz_csapat.id, Ijasz_csapat.Iskolanev HAVING COUNT(DISTINCT Ijasz_csapat.jatekos_Id) = 3 ORDER BY osszes_pontszam DESC LIMIT 1";
            olvasas = lekerdezes.ExecuteReader();
            while (olvasas.Read())
            {
                string csapatNev = olvasas.GetString(0);
                long osszesPontszam = olvasas.GetInt64(1);
                Console.WriteLine("Csapat neve: " + csapatNev + ", Összes pontszám: " + osszesPontszam);
            }
            olvasas.Close();

            Console.ReadKey();
        }
    }
}
