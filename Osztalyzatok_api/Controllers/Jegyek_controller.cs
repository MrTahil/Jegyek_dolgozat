using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Osztalyzatok_api.Model;
using System;
using System.Data.Common;
using System.Reflection.Metadata.Ecma335;

namespace Osztalyzatok_api.Controllers
{
    [Route("Jegyek")]
    [ApiController]

    public class ProductsController : ControllerBase
    {
        public int count = 0;
        private readonly Connect _connection;

        public ProductsController()
        {
            _connection = new Connect();

        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Jegyek>>> Get()
        {
            var jegyek = new List<Jegyek>();
            await _connection.Connection.OpenAsync();

            string query = "SELECT * FROM Osztalyzatok";
            using (var command2 = new MySqlCommand(query, _connection.Connection))
            {
                using (var reader = await command2.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var jegy = new Jegyek
                        {
                            Azon = reader.GetInt32(0),
                            Jegy = reader.GetInt32(1),
                            Leiras = reader.GetString(2),
                            Letrehozas = reader.GetDateTime(3)
                        };
                        jegyek.Add(jegy);
                    }
                }

            }



            return Ok(jegyek);
        }
    }
}
