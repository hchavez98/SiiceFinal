using Sindicato_v1.Filters;
using Sindicato_v1.Models;
using Sindicato_v1.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Sindicato_v1.Controllers
{
    public class TipoActaController : Controller
    {
        // GET: EstadoCivil
        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult Mant_TipoActa()
        {
            try
            {
                ViewBag.Msg = TempData["msg"].ToString();
            }
            catch (Exception)
            {

            }

            try
            {
                ViewData["Nombre"] = AccesoController.nombre;
                ViewData["Apellido"] = AccesoController.apellido;

                List<SelectTipoActaViewModel> lst;
                using (SII_Entities db = new SII_Entities())
                {
                    lst = (from d in db.Tbl_TipoActa
                           where d.estado == 1 || d.estado == 3
                           select new SelectTipoActaViewModel
                           {
                               id_TipoActa = d.id_TipoActa,
                               TipoActa = d.TipoActa,
                               estado = d.estado
                           }).ToList();
                }
                return View(lst);
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }

        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult Nuevo_TipoActa()
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            return View();
        }

        [AuthorizeUser(permiso: 1, tusu: 3)]
        [HttpPost]
        public ActionResult Nuevo_TipoActa(AddTipoActaViewModel model)
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            try
            {
                if (ModelState.IsValid)
                {
                    using (SII_Entities db = new SII_Entities())
                    {
                        var obj_TipoActa = new Tbl_TipoActa();
                        obj_TipoActa.TipoActa = model.TipoActa;
                        obj_TipoActa.estado = 1;
                        db.Tbl_TipoActa.Add(obj_TipoActa);
                        db.SaveChanges();

                        TempData["msg"] = "Agregado";
                        ViewBag.Msg = TempData["msg"];
                    }
                    return Redirect("/TipoActa/Mant_TipoActa");

                }
                return View(model);
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }

        [AuthorizeUser(permiso: 1, tusu: 3)]
        public ActionResult Editar_TipoActa(int? ID)
        {
            try
            {
                ViewData["Nombre"] = AccesoController.nombre;
                ViewData["Apellido"] = AccesoController.apellido;

                AddTipoActaViewModel model = new AddTipoActaViewModel();
                using (SII_Entities db = new SII_Entities())
                {
                    var obj_TipoActa = db.Tbl_TipoActa.Find(ID);
                    model.TipoActa = obj_TipoActa.TipoActa;
                    model.id_TipoActa = obj_TipoActa.id_TipoActa;
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
        public ActionResult Editar_TipoActa(AddTipoActaViewModel model)
        {
            ViewData["Nombre"] = AccesoController.nombre;
            ViewData["Apellido"] = AccesoController.apellido;
            try
            {
                if (ModelState.IsValid)
                {
                    using (SII_Entities db = new SII_Entities())
                    {
                        var obj_TipoActa = db.Tbl_TipoActa.Find(model.id_TipoActa);
                        obj_TipoActa.TipoActa = model.TipoActa;
                        db.Entry(obj_TipoActa).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();

                        TempData["msg"] = "Modificado";
                        ViewBag.Msg = TempData["msg"];
                    }
                    return Redirect("/TipoActa/Mant_TipoActa");
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
        public ActionResult Eliminar_TipoActa(int? id)
        {
            try
            {
                using (SII_Entities db = new SII_Entities())
                {
                    var obj_TipoActa = db.Tbl_TipoActa.Find(id);

                    if (obj_TipoActa.estado == 3)
                    {
                        obj_TipoActa.estado = 0;
                        db.Entry(obj_TipoActa).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();

                        TempData["msg"] = "Eliminado";
                        ViewBag.Msg = TempData["msg"];
                    }

                    if (obj_TipoActa.estado == 1)
                    {
                        try
                        {
                            db.Tbl_TipoActa.Remove(obj_TipoActa);
                            db.SaveChanges();

                            TempData["msg"] = "Eliminado";
                            ViewBag.Msg = TempData["msg"];
                        }
                        catch (Exception)
                        {
                            TempData["msg"] = "Error";
                            ViewBag.Msg = TempData["msg"];
                        }
                    }
                }
                return Redirect("/TipoActa/Mant_TipoActa");
            }
            catch (Exception)
            {
                return Redirect("/Error/InaccessiblePage");
            }
        }
    }
}