#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GoalSystems.Models;
using GoalSystemsDb.Data;

namespace GoalSystemsDb.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class IncidenciasController : ControllerBase
    {
        private readonly GoalSystemsDbContext _context;

        public IncidenciasController(GoalSystemsDbContext context)
        {
            _context = context;
        }

        // GET: api/Incidencias
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Incidencias>>> GetIncidencia()
        {
            return await _context.Incidencias.Include(a => a.Empleado.Empresa).ToListAsync();
        }

        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult<IEnumerable<IncidenciasListado>>> GetIncidenciasByEmpleado(int idEmpleado)
        {
            List<Incidencias> lista = await _context.Incidencias.Include(a => a.Empleado.Empresa).Where(a => a.IdEmpleado == idEmpleado).ToListAsync();

            List<IncidenciasListado> listaIncidencias = new List<IncidenciasListado>();

            foreach (var item in lista)
            {
                IncidenciasListado incidencia = new IncidenciasListado()
                {
                    Id = item.Id,
                    NombreEmpleado = item.Empleado.Nombre + " " + item.Empleado.Apellidos,
                    Descripcion = item.Descripcion,
                    FechaAlta = item.FechaAlta
                };

                listaIncidencias.Add(incidencia);
            }

            return listaIncidencias;
        }

        [HttpPost]
        public async Task<ActionResult<Incidencias>> AddIncidencia(Incidencias incidencia)
        {
            _context.Incidencias.Add(incidencia);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetIncidencia", new { Id = incidencia.Id }, incidencia);
        }

        // DELETE: api/Incidencias/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteIncidencia(int id)
        {
            var incidencia = await _context.Incidencias.FindAsync(id);
            if (incidencia == null)
            {
                return NotFound();
            }

            _context.Incidencias.Remove(incidencia);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool IncidenciaExists(int id)
        {
            return _context.Incidencias.Any(e => e.Id == id);
        }
    }
}