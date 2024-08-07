using Microsoft.EntityFrameworkCore;
using springWishList.Conection;
using springWishList.Servise;
using springWishList.stayle;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<RegionService>();
builder.Services.AddScoped<springService>();

var connectionString = builder.Configuration. GetConnectionString("DBconnectionString");
builder.Services.AddDbContext<DBconection>(options => options.UseNpgsql(connectionString));

var app = builder.Build();

if (app.Environment.IsDevelopment()) {
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.UseRouting();

terminalStayle.Welcom();

app.Run();

