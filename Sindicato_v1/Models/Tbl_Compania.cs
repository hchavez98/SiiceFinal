//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sindicato_v1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Compania
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tbl_Compania()
        {
            this.Tbl_Departamento = new HashSet<Tbl_Departamento>();
        }
    
        public int id_Compania { get; set; }
        public string razon_Social { get; set; }
        public int cedula_Juridica { get; set; }
        public string nom_Compania { get; set; }
        public string direccion { get; set; }
        public int telefono { get; set; }
        public string correo_Electronico { get; set; }
        public int estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Departamento> Tbl_Departamento { get; set; }
    }
}
