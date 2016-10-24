using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace org.company.order.query.domain
{
    public class Order
    {
        public Order()
        {
            this.OrderDetail = new HashSet<OrderDetail>();
        }

        [Key]
        public int OrderId { get; set; }
        public Guid CustomerId { get; set; }
        public int StatusId { get; set; }
        public string Number { get; set; }

        public DateTime? OrderDate { get; set; }
        public bool Active { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        
        public Status Status { get; set; }

    }

   
}
