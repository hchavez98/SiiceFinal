using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sindicato_v1.Models.ViewModels
{
    public class AddTipoActaViewModel
    {

        public int id_TipoActa { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Tipo acta")]
        [RegularExpression("^[a-zA-ZáÁéÉóÓÚú ]+$", ErrorMessage = "Digitar unicamente letras")]
        public string TipoActa { get; set; }
    }
}