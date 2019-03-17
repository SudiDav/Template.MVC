﻿using System.Collections.Generic;
using Template.Models.DomainModels;
using Template.Models.ServiceModels.Admin;

namespace Template.Models.ViewModels.Admin
{
    public class ConfigurationManagementViewModel : ViewModel
    {
        #region Constructors

        public ConfigurationManagementViewModel()
        {
            ConfigurationItems = new List<ConfigurationItem>();
        }

        #endregion

        public List<ConfigurationItem> ConfigurationItems { get; set; }
    }
}
