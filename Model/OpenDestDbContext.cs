using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class OpenDestDbContext: DbContext
    {
        public OpenDestDbContext(DbContextOptions<OpenDestDbContext> opt) : base(opt)
        {

        }
        protected OpenDestDbContext()
        {
        }

        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductSales> ProductSales { get; set; }
        public virtual DbSet<ProductRating> ProductRating { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }

    }
}
