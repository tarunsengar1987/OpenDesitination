using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Model
{
    [Table("Products")]
    public class Products
    {
        [Key]
        public int Id { get; set; }
        [Column("name")]
        public string Name { get; set; }
        public decimal UnitPrice { get; set; }
        public int CompanyId { get; set; }
        [ForeignKey("CompanyId")]
        public virtual Brand Brand { get; set; }
        public List<ProductRating> ProductRatings { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
        public bool? IsActive { get; set; }
    }
}
