﻿namespace org.company.order.query.domain
{
    public class Inventory
    {
        public int WarehouseId { get; set; }
        public int ProductId { get; set; }
        public int Stock { get; set; }
        public Warehouse Warehouse { get; set; }
        public Product Product { get; set; }
    }
}
