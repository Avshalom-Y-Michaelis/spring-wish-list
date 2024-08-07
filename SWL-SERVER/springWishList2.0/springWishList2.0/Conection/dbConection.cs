using Microsoft.EntityFrameworkCore;
using springWishList.Models;

namespace springWishList.Conection {
    public partial class DBconection : DbContext {
        public DBconection(DbContextOptions options) : base(options) {}
        public DbSet<Spring> Spring { get; set; }
        public DbSet<Region> Region { get; set; }  
    }
}
