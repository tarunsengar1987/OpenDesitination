using System;
using System.Collections.Generic;
using System.Text;

namespace Model.ModelCRU
{
    public class ProductSearch
    {
        public string ProductName { get; set; }
        public int? Rating { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public int? SkipSize { get; set; }
        public int? TakeSize { get; set; }
        public string OrderByColumnName { get; set; }
        public bool? OrderBy { get; set; }
    }
}
