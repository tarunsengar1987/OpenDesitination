using Model.ModelCRU;
using System;
using System.Collections.Generic;
using System.Text;

namespace OpenDestination.Data
{
    public interface IProductRep
    {
        IEnumerable<ProductReturn> SearchProduct(ProductSearch productSearch); 
    }
}
