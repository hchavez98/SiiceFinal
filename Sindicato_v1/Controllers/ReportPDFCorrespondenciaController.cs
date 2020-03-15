using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sindicato_v1.Models;
using Sindicato_v1.Models.ViewModels;
using Sindicato_v1.Filters;

namespace Sindicato_v1.Controllers
{
    public class ReportPDFCorrespondenciaController : Controller
    {
        SII_Entities db = new SII_Entities();
        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult ShowCorrespondencia()
        {
            try
            {
                ViewBag.Msg = TempData["msg"].ToString();
            }
            catch (Exception)
            {

            }
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            try
            {
                List<CorrespondenciaInfoEntity> lst;
                using (SII_Entities db = new SII_Entities())
                {
                    lst = (from n in db.Tbl_Correspondencia
                           where n.estado == 1
                           select new CorrespondenciaInfoEntity
                           {
                               id_Correspondencia = n.id_Correspondencia,
                               titulo_Correspondencia = n.titulo_Correspondencia,
                               fecha_Creacion_C = n.fecha_Creacion_C,
                               subtitulo_Correspondencia = n.subtitulo_Correspondencia,
                               contenido_Correspondencia = n.contenido_Correspondencia
                           }).ToList();
                }
                return View(lst);
            }
            catch (Exception)
            {
                throw;
            }
        }



        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult PDFCorrespondencia()
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            return View();
        }



        [AuthorizeUser(permiso: 1, tusu: 3)]
        [HttpPost]
        public ActionResult PDFCorrespondencia(AddcorrespondenciaViewModel model)
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            try
            {
                if (ModelState.IsValid)
                {
                    using (SII_Entities db = new SII_Entities())
                    {
                        var obj_Correspondencia = new Tbl_Correspondencia();
                        obj_Correspondencia.titulo_Correspondencia = model.titulo_Correspondencia;
                        obj_Correspondencia.fecha_Creacion_C = DateTime.Now;
                        obj_Correspondencia.subtitulo_Correspondencia = model.subtitulo_Correspondencia;
                        obj_Correspondencia.contenido_Correspondencia = model.contenido_Correspondencia;
                        obj_Correspondencia.estado = 1;
                        db.Tbl_Correspondencia.Add(obj_Correspondencia);
                        db.SaveChanges();

                        TempData["msg"] = "Agregado";
                        ViewBag.Msg = TempData["msg"];
                    }
                    return Redirect("/ReportPDFCorrespondencia/ShowCorrespondencia");
                }
                return View(model);
            }
            catch (Exception)
            {
                throw;
            }
        }



        [AuthorizeUser(permiso: 1, tusu: 3)]
        [HttpGet]
        public ActionResult PDF(int IdCorrespondencia)
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            MemoryStream ms = new MemoryStream();
            Document document = new Document(iTextSharp.text.PageSize.LETTER, 30f, 20f, 50f, 40f);
            PdfWriter pw = PdfWriter.GetInstance(document, ms);
            pw.PageEvent = new HeaderFooterN();
            document.Open();

            //iTextSharp.text.Image PNG = iTextSharp.text.Image.GetInstance("/Content/Resources/Images/LogoSIICE.png");
            //document.Add(PNG);

            BaseFont bf = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1250, BaseFont.EMBEDDED);
            Font fontText = new Font(bf, 12, 0, BaseColor.BLACK);
            PdfPTable table = new PdfPTable(1);
            table.WidthPercentage = 100f;
            using (SII_Entities db = new SII_Entities())
            {
                var Correspondencia = (from n in db.Tbl_Correspondencia
                                       where n.id_Correspondencia == IdCorrespondencia
                                       select n).FirstOrDefault();
                PdfPCell _cell = new PdfPCell();
                _cell = new PdfPCell(new Paragraph(Correspondencia.id_Correspondencia.ToString(), fontText));
                _cell.HorizontalAlignment = Element.ALIGN_CENTER;
                table.AddCell(_cell);
                _cell = new PdfPCell(new Paragraph(Correspondencia.fecha_Creacion_C.ToString(), fontText));
                _cell.HorizontalAlignment = Element.ALIGN_CENTER;
                table.AddCell(_cell);
                table.AddCell(new Paragraph(Correspondencia.titulo_Correspondencia, fontText));
                table.AddCell(new Paragraph(Correspondencia.subtitulo_Correspondencia, fontText));
                table.AddCell(new Paragraph(Correspondencia.contenido_Correspondencia, fontText));
            }
            document.Add(table);
            document.Close();

            byte[] bytesStream = ms.ToArray();
            ms = new MemoryStream();
            ms.Write(bytesStream, 0, bytesStream.Length);
            ms.Position = 0;

            return new FileStreamResult(ms, "application/pdf");
        }

        class HeaderFooterN : PdfPageEventHelper
        {
            public override void OnEndPage(PdfWriter writer, Document document)
            {
                //base.OnEndPage(writer, document);
                PdfPTable tbHeader = new PdfPTable(3);
                tbHeader.TotalWidth = document.PageSize.Width - document.LeftMargin - document.RightMargin;
                tbHeader.DefaultCell.Border = 0;
                //iTextSharp.text.Image PNG = iTextSharp.text.Image.GetInstance("LogoSIICE.png");
                document.Add(new Paragraph());
                tbHeader.AddCell(new Paragraph());
                PdfPCell _cell = new PdfPCell(new Paragraph("Prueba de PDF"));
                _cell.HorizontalAlignment = Element.ALIGN_CENTER;
                _cell.Border = 0;
                tbHeader.AddCell(_cell);
                tbHeader.AddCell(new Paragraph());
                tbHeader.WriteSelectedRows(0, -1, document.LeftMargin, writer.PageSize.GetTop(document.TopMargin) + 40, writer.DirectContent);

                PdfPTable tbFooter = new PdfPTable(3);
                tbFooter.TotalWidth = document.PageSize.Width - document.LeftMargin - document.RightMargin;
                tbFooter.DefaultCell.Border = 0;
                tbFooter.AddCell(new Paragraph());
                _cell = new PdfPCell(new Paragraph("Acta"));
                _cell.HorizontalAlignment = Element.ALIGN_CENTER;
                _cell.Border = 0;
                tbFooter.AddCell(_cell);
                _cell = new PdfPCell(new Paragraph("Pagina " + writer.PageNumber));
                _cell.HorizontalAlignment = Element.ALIGN_RIGHT;
                _cell.Border = 0;
                tbFooter.AddCell(_cell);
                tbFooter.WriteSelectedRows(0, -1, document.LeftMargin, writer.PageSize.GetBottom(document.BottomMargin) - 5, writer.DirectContent);
            }
        }


        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult Editar_Correspondencia(int? IdCorrespondencia)
        {
            try
            {
                ViewData["Nombre"] = AccesoController.nombre;
                ViewData["Apellido"] = AccesoController.apellido;

                AddcorrespondenciaViewModel model = new AddcorrespondenciaViewModel();
                using (SII_Entities db = new SII_Entities())
                {
                    var obj_Correspondencia = db.Tbl_Correspondencia.Find(IdCorrespondencia);
                    model.id_Correspondencia = obj_Correspondencia.id_Correspondencia;
                    model.fecha_Creacion_C = obj_Correspondencia.fecha_Creacion_C;
                    model.titulo_Correspondencia = obj_Correspondencia.titulo_Correspondencia;
                    model.subtitulo_Correspondencia = obj_Correspondencia.subtitulo_Correspondencia;
                    model.contenido_Correspondencia = obj_Correspondencia.contenido_Correspondencia;
                }
                return View(model);
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }



        [AuthorizeUser(permiso: 1, tusu: 3)]
        [HttpPost]
        public ActionResult Editar_Correspondencia(AddcorrespondenciaViewModel model)
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            try
            {
                if (ModelState.IsValid)
                {
                    using (SII_Entities db = new SII_Entities())
                    {
                        var obj_Correspondencia = db.Tbl_Correspondencia.Find(model.id_Correspondencia);
                        obj_Correspondencia.id_Correspondencia = model.id_Correspondencia;
                        obj_Correspondencia.titulo_Correspondencia = model.titulo_Correspondencia;
                        obj_Correspondencia.subtitulo_Correspondencia = model.subtitulo_Correspondencia;
                        obj_Correspondencia.contenido_Correspondencia = model.contenido_Correspondencia;
                        db.Entry(obj_Correspondencia).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        TempData["msg"] = "Modificado";
                        ViewBag.Msg = TempData["msg"];
                    }
                    return Redirect("/ReportPDFCorrespondencia/ShowCorrespondencia");
                }
                return View(model);
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }



        [AuthorizeUser(permiso: 1, tusu: 3)]
        [HttpGet]
        public ActionResult Eliminar_Correspondencia(int? IdCorrespondencia)
        {
            try
            {
                using (SII_Entities db = new SII_Entities())
                {
                    try
                    {
                        var obj_Correspondencia = db.Tbl_NoticiasPDF.Find(IdCorrespondencia);

                        if (obj_Correspondencia.estado == 1)
                        {
                            obj_Correspondencia.estado = 0;
                            db.Entry(obj_Correspondencia).State = System.Data.Entity.EntityState.Modified;
                            db.SaveChanges();

                            TempData["msg"] = "Eliminado";
                            ViewBag.Msg = TempData["msg"];
                        }
                    }
                    catch (Exception)
                    {
                        TempData["msg"] = "Error";
                        ViewBag.Msg = TempData["msg"];
                    }
                }
                return Redirect("/ReportPDFCorrespondencia/ShowNoticias");
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }
    }
}