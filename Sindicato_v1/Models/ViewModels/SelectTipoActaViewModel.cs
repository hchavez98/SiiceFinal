using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sindicato_v1.Models.ViewModels
{
    public class SelectTipoActaViewModel
    {
        public int id_TipoActa { get; set; }
        public string TipoActa { get; set; }
        public int estado { get; set; }
    }
}