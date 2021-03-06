﻿using Template.Infrastructure.Configuration.Models;

namespace Template.Infrastructure.Repositories
{
    public class BaseSQLRepo
    {
        private readonly ConnectionStringSettings _connectionStrings;

        public BaseSQLRepo(ConnectionStringSettings connectionStrings)
        {
            _connectionStrings = connectionStrings;
        }

        protected virtual string DefaultConnectionString
        {
            get
            {
                return _connectionStrings.DefaultConnection; // specifies a specific connection string
            }
        }

        protected virtual int DefaultTimeOut
        {
            get
            {
                return _connectionStrings.Timeout;
            }
        }
    }
}
