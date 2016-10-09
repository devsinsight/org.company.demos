﻿using System.Threading.Tasks;
using org.company.messaging;
using org.company.inventory.command.domain;
using org.company.inventory.command.domain.generic;
using org.company.messages.events;

namespace org.company.inventory.command.handler
{

    public class InventoryHandler :
        IStartHandler,
        IEventHandler<PlacedOrder>
    {

        private readonly IInventoryRepository _inventoryRepository;
        private readonly IUnitOfWork _uof;

        private readonly IServiceBus _bus;

        public InventoryHandler(
            IServiceBus bus,
            IInventoryRepository inventoryRepository,
            IUnitOfWork uof
            )
        {
            _bus = bus;
            _inventoryRepository = inventoryRepository;
            _uof = uof;
        }


        public void start()
        {
            _bus.SubscribeAsync<PlacedOrder>(async (msg) => await Handle(msg));
        }


        public Task Handle(PlacedOrder adjustStock)
        {
            adjustStock.Products.ForEach(prod =>
            {
                _inventoryRepository.AdjustStock(prod.ProductId, prod.Quantity);
            });

            _uof.Commit();

            return Task.CompletedTask;
        }




    }
}