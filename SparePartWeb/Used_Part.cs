//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SparePartWeb
{
    using System;
    using System.Collections.Generic;
    
    public partial class Used_Part
    {
        public string Equip_ID { get; set; }
        public int Main_ID { get; set; }
        public string Name_sparepart_used { get; set; }
    
        public virtual Equipment_1 Equipment_1 { get; set; }
        public virtual Maintenance_1 Maintenance_1 { get; set; }
    }
}