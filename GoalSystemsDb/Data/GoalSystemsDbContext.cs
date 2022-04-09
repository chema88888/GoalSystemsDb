#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using GoalSystems.Models;

namespace GoalSystemsDb.Data
{
    public class GoalSystemsDbContext : DbContext
    {
        public GoalSystemsDbContext (DbContextOptions<GoalSystemsDbContext> options)
            : base(options)
        {
        }

        public DbSet<GoalSystems.Models.Empleados> Empleados { get; set; }

        public DbSet<GoalSystems.Models.Empresas> Empresas { get; set; }

        public DbSet<GoalSystems.Models.Tareas> Tareas { get; set; }

        public DbSet<GoalSystems.Models.Incidencias> Incidencias { get; set; }
    }
}
