using BoardGameHelper.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BoardGameHelper.DAL
{
    public class TestCardContext : DbContext
    {
        public DbSet<TestCard> TestCards { get; set; }
    }
}