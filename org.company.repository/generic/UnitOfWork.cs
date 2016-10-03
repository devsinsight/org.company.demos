﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using org.company.order.contract.generic;
using System;
using System.Threading.Tasks;

namespace org.company.repository.generic
{
    public class UnitOfWork : IUnitOfWork
    {
        public CommandDbContext context;

        public UnitOfWork(CommandDbContext context)
        {
            this.context = context;
        }

        public void Commit() => context.SaveChanges();

        public async Task CommitAsync() => await context.SaveChangesAsync();

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
                context.Dispose();

            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
