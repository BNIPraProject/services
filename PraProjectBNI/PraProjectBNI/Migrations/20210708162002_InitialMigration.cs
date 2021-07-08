using Microsoft.EntityFrameworkCore.Migrations;

namespace PraProjectBNI.Migrations
{
    public partial class InitialMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Course",
                columns: table => new
                {
                    ID_Course = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama_Course = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Course", x => x.ID_Course);
                });

            migrationBuilder.CreateTable(
                name: "Dosen",
                columns: table => new
                {
                    ID_Dosen = table.Column<int>(type: "int", nullable: false),
                    Nama_Dosen = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dosen", x => x.ID_Dosen);
                });

            migrationBuilder.CreateTable(
                name: "Student",
                columns: table => new
                {
                    ID_Student = table.Column<int>(type: "int", nullable: false),
                    Nama = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Domisili = table.Column<string>(type: "nchar(10)", fixedLength: true, maxLength: 10, nullable: true),
                    Angkatan = table.Column<int>(type: "int", nullable: true),
                    Jenis_Kelamin = table.Column<string>(type: "nchar(10)", fixedLength: true, maxLength: 10, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Student", x => x.ID_Student);
                });

            migrationBuilder.CreateTable(
                name: "Dosen_Course",
                columns: table => new
                {
                    ID_Dosen_Course = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ID_Dosen = table.Column<int>(type: "int", nullable: false),
                    ID_Course = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dosen_Course", x => x.ID_Dosen_Course);
                    table.ForeignKey(
                        name: "FK_Dosen_Course_Course",
                        column: x => x.ID_Course,
                        principalTable: "Course",
                        principalColumn: "ID_Course",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Dosen_Course_Dosen",
                        column: x => x.ID_Dosen,
                        principalTable: "Dosen",
                        principalColumn: "ID_Dosen",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Enrollment",
                columns: table => new
                {
                    ID_Enroll = table.Column<int>(type: "int", nullable: false),
                    ID_Course = table.Column<int>(type: "int", nullable: false),
                    ID_Student = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Enrollment", x => x.ID_Enroll);
                    table.ForeignKey(
                        name: "FK_Enrollment_Course",
                        column: x => x.ID_Course,
                        principalTable: "Course",
                        principalColumn: "ID_Course",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Enrollment_Student",
                        column: x => x.ID_Student,
                        principalTable: "Student",
                        principalColumn: "ID_Student",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Dosen_Course_ID_Course",
                table: "Dosen_Course",
                column: "ID_Course");

            migrationBuilder.CreateIndex(
                name: "IX_Dosen_Course_ID_Dosen",
                table: "Dosen_Course",
                column: "ID_Dosen");

            migrationBuilder.CreateIndex(
                name: "IX_Enrollment_ID_Course",
                table: "Enrollment",
                column: "ID_Course");

            migrationBuilder.CreateIndex(
                name: "IX_Enrollment_ID_Student",
                table: "Enrollment",
                column: "ID_Student");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Dosen_Course");

            migrationBuilder.DropTable(
                name: "Enrollment");

            migrationBuilder.DropTable(
                name: "Dosen");

            migrationBuilder.DropTable(
                name: "Course");

            migrationBuilder.DropTable(
                name: "Student");
        }
    }
}
