﻿
namespace org.company.order.query.domain
{
    public class OrderDetail
    {
        public OrderDetail() { }
   
        public int OrderId { get; set; }
      
        public int ProductId { get; set; }
        public int Quantity { get; set; }

        public Order Order { get; set; }

    }
}
