using Model;
using Model.ModelCRU;
using System;
using System.Collections.Generic;
using System.Linq;

namespace OpenDestination.Data
{
    public class ProductRep : IProductRep
    {
        private readonly OpenDestDbContext _dbContext;
        public ProductRep(OpenDestDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IEnumerable<ProductReturn> SearchProduct(ProductSearch productSearch)
        {
            //var productratings = _dbContext.ProductRating.ToList();
            try
            {
                IQueryable<Products> IQproducts = _dbContext.Products.Where(x =>
                                        x.Name.Contains(productSearch.ProductName)
                                   );
                if (productSearch.MinPrice != null && productSearch.MaxPrice != null)
                {
                    IQproducts = IQproducts.Where(x => x.UnitPrice >= productSearch.MinPrice && x.UnitPrice <= productSearch.MaxPrice);
                }
                else if (productSearch.MinPrice != null)
                {
                    IQproducts = IQproducts.Where(x => x.UnitPrice >= productSearch.MinPrice);
                }
                else if (productSearch.MaxPrice != null)
                {
                    IQproducts = IQproducts.Where(x => x.UnitPrice <= productSearch.MaxPrice);
                }
                List<Products> products = IQproducts.ToList();
                List<ProductReturn> productReturns = new List<ProductReturn>();
                foreach (Products prod in products)
                {
                    prod.Brand = _dbContext.Brands.Find(prod.CompanyId);
                    ProductReturn obj = new ProductReturn
                    {
                        CompanyName = prod.Brand.Name,
                        ProductName = prod.Name,
                        Price = prod.UnitPrice,
                        ProductRating = Math.Round(_dbContext.ProductRating.Where(x => x.ProductId == prod.Id).Average(x => x.Rate), 2)
                    };
                    if (productSearch.Rating != null)
                    {
                        if (productSearch.Rating <= obj.ProductRating)
                        {
                            productReturns.Add(obj);
                        }
                    }
                    else
                    {
                        productReturns.Add(obj);
                    }
                }
                if(productSearch.OrderByColumnName == "ProductName")
                {
                    if(productSearch.OrderBy == true)
                    {
                        return productReturns.OrderBy(x => x.ProductName).Take(10);
                    }
                    return productReturns.OrderByDescending(x => x.ProductName).Take(10);
                }
                else if(productSearch.OrderByColumnName == "BrandName")
                {
                    if (productSearch.OrderBy == true)
                    {
                        return productReturns.OrderBy(x => x.CompanyName).Take(10);
                    }
                    return productReturns.OrderByDescending(x => x.CompanyName).Take(10);
                }
                else if(productSearch.OrderByColumnName == "Price")
                {
                    if (productSearch.OrderBy == true)
                    {
                        return productReturns.OrderBy(x => x.Price).Take(10);
                    }
                    return productReturns.OrderByDescending(x => x.Price).Take(10);
                }
                else if(productSearch.OrderByColumnName == "Rating")
                {
                    if (productSearch.OrderBy == true)
                    {
                        return productReturns.OrderBy(x => x.ProductRating).Take(10);
                    }
                    return productReturns.OrderByDescending(x => x.ProductRating).Take(10);
                }
                var result = productReturns.OrderByDescending(x => x.Price).Take(10);
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
