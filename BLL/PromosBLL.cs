using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BE;

namespace BLL
{
    public class PromosBLL
    {
        private readonly PromosDAL productRepository;

        public PromosBLL(PromosDAL repository)
        {
            productRepository = repository;
        }

        public List<Product> GetProducts()
        {
            return productRepository.GetProducts();
        }
    }
}