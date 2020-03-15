using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sindicato_v1.Models.ViewModels
{
    public class AddcorrespondenciaViewModel
    {

        public int id_Correspondencia { get; set; }

        public DateTime fecha_Creacion_C { get; set; }

        [Required(ErrorMessage = "Debe ingresar un título")]
        [DataType(DataType.Text)]
        [Display(Name = "Título")]
        public string titulo_Correspondencia { get; set; }

        [Required(ErrorMessage = "Debe ingresar un asunto")]
        [DataType(DataType.Text)]
        [Display(Name = "Asunto")]
        public string subtitulo_Correspondencia { get; set; }

        [Required(ErrorMessage = "Debe ingresar un texto")]
        [Display(Name = "Contenido del documento")]
        [DataType(DataType.MultilineText)]
        public string contenido_Correspondencia { get; set; }

        public int estado { get; set; }

    }
}