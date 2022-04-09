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
    [Route("api/[controller]")]
    [ApiController]
    public class TareasController : ControllerBase
    {
        private readonly GoalSystemsDbContext _context;

        public TareasController(GoalSystemsDbContext context)
        {
            _context = context;
        }

        // GET: api/Tareas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tareas>>> GetTarea()
        {
            return await _context.Tareas.ToListAsync();
        }        
    }
}