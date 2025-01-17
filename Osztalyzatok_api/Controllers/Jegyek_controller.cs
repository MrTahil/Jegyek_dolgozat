﻿using Microsoft.AspNetCore.Http;
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


        [HttpPost]
        public async Task<ActionResult<Jegyek>> Post([FromBody] Jegyek jegyek)
        {
            if (jegyek == null)
            {
                return BadRequest("Nem lehet nulla");
            }

            await _connection.Connection.OpenAsync();

            string query = "INSERT INTO Osztalyzatok (Azon, Jegy, leiras, Letrehozas) VALUES (@Azon, @Jegy, @Leiras, @Letrehozas)";
            var command5 = new MySqlCommand("SELECT COUNT(*) FROM Osztalyzatok", _connection.Connection);
            count = Convert.ToInt32(await command5.ExecuteScalarAsync());
            using (var command = new MySqlCommand(query, _connection.Connection))
            {
                command.Parameters.AddWithValue("@Azon", count + 1);
                command.Parameters.AddWithValue("@Jegy", jegyek.Jegy);
                command.Parameters.AddWithValue("@Leiras", jegyek.Leiras);
                command.Parameters.AddWithValue("@Letrehozas", DateTime.Now);


                await command.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();


            return CreatedAtAction("Get", new { id = count + 1 }, jegyek);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Jegyek>> Put(int id, [FromBody] Jegyek jegyek)
        {
            if (jegyek == null)
            {
                return BadRequest("Nem lehet nulla");
            }

            await _connection.Connection.OpenAsync();




            string updateQuery = "UPDATE Osztalyzatok SET Jegy = @Jegy, Leiras = @Leiras, Letrehozas = @Letrehozas WHERE Azon = @Azon";
            using (var updateCommand = new MySqlCommand(updateQuery, _connection.Connection))
            {
                updateCommand.Parameters.AddWithValue("@Azon", id);
                updateCommand.Parameters.AddWithValue("Jegy", jegyek.Jegy);
                updateCommand.Parameters.AddWithValue("@Leiras",jegyek.Leiras );
                updateCommand.Parameters.AddWithValue("@Letrehozas", DateTime.Now);

                await updateCommand.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();

            return NoContent();

        }
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _connection.Connection.OpenAsync();

            string deleteQuery = "DELETE FROM Osztalyzatok WHERE Azon = @Azon";
            using (var deleteCommand = new MySqlCommand(deleteQuery, _connection.Connection))
            {
                deleteCommand.Parameters.AddWithValue("@Azon", id);
                await deleteCommand.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();

            return NoContent();
        }





    }
}
