using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sindicato_v1.Models.ViewModels
{
    public class CorrespondenciaInfoEntity
    {

        public int id_Correspondencia { get; set; }
        public DateTime fecha_Creacion_C { get; set; }
        public string titulo_Correspondencia { get; set; }
        public string subtitulo_Correspondencia { get; set; }
        public string contenido_Correspondencia { get; set; }
        public int estado { get; set; }

    }
}