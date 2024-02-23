using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Model
{
    [Table("productsales")]
    public class ProductSales
    {
        [Key]
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int QtySold { get; set; }
        public double UnitPrice { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
        public bool? IsActive { get; set; }
    }
}
